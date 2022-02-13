//
//  FeedView.swift
//  Sample2
//
//  Created by Adrian Mateoaea on 12.02.2022.
//

import SwiftUI
import Apollo
import ApolloSQLite

class MutationResult: ObservableObject {
    @Published private(set) var error: Error? {
        didSet {
            _hasError = error != nil
        }
    }
    @Published private(set) var loading: Bool = false
    
    private var _hasError = false
    var hasError: Binding<Bool> {
        return .init { self._hasError } set: { self._hasError = $0 }
    }
    
    func fetch<Mutation: GraphQLMutation>(_ mutation: Mutation, _ callback: ((Mutation.Data) -> Void)? = nil) {
        loading = true
        error = nil
        
        Network.shared.apollo.perform(mutation: mutation, publishResultToStore: true, queue: .main) { [weak self] result in
            defer { self?.loading = false }

            do {
                let data = try result.get()
                if let data = data.data, let callback = callback {
                    callback(data)
                }
                self?.error = data.errors?.first
            } catch let error {
                self?.error = error
            }
        }
    }
}

@propertyWrapper struct Mutation: DynamicProperty {
    @ObservedObject private var value = MutationResult()
    
    var wrappedValue: MutationResult {
        return value
    }
}

class Network {
    static let shared = Network()
    
    lazy var store: ApolloStore = {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let documentsURL = URL(fileURLWithPath: documentsPath)
        let sqliteFileURL = documentsURL.appendingPathComponent("apollo_cache.sqlite")

        let sqliteCache = try! SQLiteNormalizedCache(fileURL: sqliteFileURL)

        return ApolloStore(cache: sqliteCache)
    }()
    
    lazy var apollo: ApolloClient = {
        let url = URL(string: "https://api.sote.life/graphql")!
        let interceptor = DefaultInterceptorProvider(store: store)
        let networkTransport = RequestChainNetworkTransport(interceptorProvider: interceptor, endpointURL: url)
        
        let apollo = ApolloClient(networkTransport: networkTransport, store: store)
        apollo.cacheKeyForObject = { $0["id"] }
        
        return apollo
    }()
    
    func clearCache() {
        store.clearCache()
    }
}

class QueryResult<Query, Data>: ObservableObject where Query: GraphQLQuery {
    @Published private(set) var data: Data?
    @Published private(set) var error: Error?
    @Published private(set) var loading: Bool = true
    
    private var called = false
    private let query: Query
    private let transformData: (Query.Data) -> Data
    
    private var fetch: Cancellable?
    
    init(_ query: Query, t: @escaping (Query.Data) -> Data) {
        self.query = query
        self.transformData = t
    }
    
    func a() {
        // Can refetch if the last update was 10m ago let's say
        if called { return }
        called = true
        
        loading = true
        
        fetch = Network.shared.apollo.fetch(query: query, cachePolicy: .returnCacheDataAndFetch, contextIdentifier: nil, queue: .main) { [weak self] result in
            defer {
                self?.loading = false
                self?.fetch = nil
            }
            
            do {
                let data = try result.get()
                if let data = data.data {
                    self?.data = self?.transformData(data)
                }
                self?.error = data.errors?.first
            } catch let error {
                self?.error = error
            }
        }
    }
    
    func refetch() {
        loading = true
        
        fetch?.cancel()
        fetch = Network.shared.apollo.fetch(query: query, cachePolicy: .fetchIgnoringCacheData, contextIdentifier: nil, queue: .main) { [weak self] result in
            defer {
                self?.loading = false
                self?.fetch = nil
            }
            
            do {
                let data = try result.get()
                if let data = data.data {
                    self?.data = self?.transformData(data)
                }
                self?.error = data.errors?.first
            } catch let error {
                self?.error = error
            }
        }
    }
    
    func loadMore(_ query: Query, _ transform: @escaping (Data?, Data) -> Data) {
        loading = true
        
        fetch?.cancel()
        fetch = Network.shared.apollo.fetch(query: query, cachePolicy: .fetchIgnoringCacheData, contextIdentifier: nil, queue: .main) { [weak self] result in
            defer {
                self?.loading = false
                self?.fetch = nil
            }
            
            do {
                let data = try result.get()
                
                if let data = data.data, let self = self {
                    self.data = transform(self.data, self.transformData(data))
                }
                
                self?.error = data.errors?.first
            } catch let error {
                self?.error = error
            }
        }
    }
    
    deinit {
        fetch?.cancel()
    }
}

@propertyWrapper struct Query<Query, Data>: DynamicProperty where Query: GraphQLQuery {
    @ObservedObject private var value: QueryResult<Query, Data>
    
    var wrappedValue: QueryResult<Query, Data> {
        return value
    }
    
    init(_ query: Query, t: @escaping (Query.Data) -> Data) {
        value = QueryResult(query, t: t)
    }
    
    func update() {
        value.a()
    }
}

extension View {
    func error(error: Error?, bi: Binding<Bool>) -> some View {
        if let error = error {
            return AnyView(self.alert("Error", isPresented: bi, actions: {}, message: { Text(error.localizedDescription) }))
        }
        return AnyView(self)
    }
}

struct FeedView: View {
    @Query(FeedQuery(page: .init()), t: { $0.feed }) var feed
    @Mutation var login

    var coordinator: ViewCoordinator?
    
    var body: some View {
        VStack {
            // Error if I add a new element
            Text(feed.loading ? "Loading..." : "")
            Text(feed.error?.localizedDescription ?? "")
            Text(String(feed.data?.count ?? 0))
            Text((feed.data?.map({ String($0.id) }) ?? []).joined(separator: ", "))
            Button("Login") {
                let mutation = LoginMutation(credentials: .init(email: "adrian2@wonderkiln.com", password: "password"))
                login.fetch(mutation) { data in
                    print(data.login.jwt.token)
                    feed.refetch()
                }
            }
                .disabled(login.loading)
                .error(error: login.error, bi: login.hasError)
            Button("Refetch") {
                feed.refetch()
            }
            Button("Load More") {
                feed.loadMore(FeedQuery(page: .init(after: feed.data?.last?.id))) { ($0 ?? []) + $1 }
            }
            Button("Profile") {
                coordinator?.goToProfile()
            }
            Button("Comments") {
                coordinator?.goToComments()
            }
            Button("Logout") {
                coordinator?.goToLogin()
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
