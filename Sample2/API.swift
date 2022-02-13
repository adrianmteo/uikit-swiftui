// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct CredentialInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - email
  ///   - password
  public init(email: String, password: String) {
    graphQLMap = ["email": email, "password": password]
  }

  public var email: String {
    get {
      return graphQLMap["email"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var password: String {
    get {
      return graphQLMap["password"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "password")
    }
  }
}

public struct FeedInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - user
  public init(user: Swift.Optional<Int?> = nil) {
    graphQLMap = ["user": user]
  }

  public var user: Swift.Optional<Int?> {
    get {
      return graphQLMap["user"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user")
    }
  }
}

public struct PageInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - after
  ///   - index
  ///   - size
  public init(after: Swift.Optional<Int?> = nil, index: Swift.Optional<Int?> = nil, size: Swift.Optional<Int?> = nil) {
    graphQLMap = ["after": after, "index": index, "size": size]
  }

  public var after: Swift.Optional<Int?> {
    get {
      return graphQLMap["after"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "after")
    }
  }

  public var index: Swift.Optional<Int?> {
    get {
      return graphQLMap["index"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "index")
    }
  }

  public var size: Swift.Optional<Int?> {
    get {
      return graphQLMap["size"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "size")
    }
  }
}

public struct ForYouFeedInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - postId
  public init(postId: Swift.Optional<Int?> = nil) {
    graphQLMap = ["postId": postId]
  }

  public var postId: Swift.Optional<Int?> {
    get {
      return graphQLMap["postId"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "postId")
    }
  }
}

public final class LoginMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation login($credentials: CredentialInput!) {
      login(credentials: $credentials) {
        __typename
        jwt {
          __typename
          token
        }
      }
    }
    """

  public let operationName: String = "login"

  public let operationIdentifier: String? = "5f8f59a97514c864fbb95711a953740efcb8f8741ac06c733a0079168ac8a682"

  public var credentials: CredentialInput

  public init(credentials: CredentialInput) {
    self.credentials = credentials
  }

  public var variables: GraphQLMap? {
    return ["credentials": credentials]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("login", arguments: ["credentials": GraphQLVariable("credentials")], type: .nonNull(.object(Login.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: Login) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "login": login.resultMap])
    }

    public var login: Login {
      get {
        return Login(unsafeResultMap: resultMap["login"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "login")
      }
    }

    public struct Login: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AuthResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("jwt", type: .nonNull(.object(Jwt.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(jwt: Jwt) {
        self.init(unsafeResultMap: ["__typename": "AuthResult", "jwt": jwt.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var jwt: Jwt {
        get {
          return Jwt(unsafeResultMap: resultMap["jwt"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "jwt")
        }
      }

      public struct Jwt: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["JwtResult"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("token", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(token: String) {
          self.init(unsafeResultMap: ["__typename": "JwtResult", "token": token])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var token: String {
          get {
            return resultMap["token"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "token")
          }
        }
      }
    }
  }
}

public final class FeedQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query feed($input: FeedInput, $page: PageInput!) {
      feed(input: $input, page: $page) {
        __typename
        ...Post
        liked
        likes
        comments
        shares
      }
    }
    """

  public let operationName: String = "feed"

  public let operationIdentifier: String? = "ebef507d76706e8a92290c951ec6c6688bd7e10daf0a7380c3d5b1d72356738f"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + Post.fragmentDefinition)
    document.append("\n" + User.fragmentDefinition)
    document.append("\n" + Media.fragmentDefinition)
    return document
  }

  public var input: FeedInput?
  public var page: PageInput

  public init(input: FeedInput? = nil, page: PageInput) {
    self.input = input
    self.page = page
  }

  public var variables: GraphQLMap? {
    return ["input": input, "page": page]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("feed", arguments: ["input": GraphQLVariable("input"), "page": GraphQLVariable("page")], type: .nonNull(.list(.nonNull(.object(Feed.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(feed: [Feed]) {
      self.init(unsafeResultMap: ["__typename": "Query", "feed": feed.map { (value: Feed) -> ResultMap in value.resultMap }])
    }

    public var feed: [Feed] {
      get {
        return (resultMap["feed"] as! [ResultMap]).map { (value: ResultMap) -> Feed in Feed(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Feed) -> ResultMap in value.resultMap }, forKey: "feed")
      }
    }

    public struct Feed: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Post"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("body", type: .scalar(String.self)),
          GraphQLField("user", type: .nonNull(.object(User.selections))),
          GraphQLField("media", type: .nonNull(.object(Medium.selections))),
          GraphQLField("views", type: .nonNull(.scalar(Int.self))),
          GraphQLField("liked", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("likes", type: .nonNull(.scalar(Int.self))),
          GraphQLField("comments", type: .nonNull(.scalar(Int.self))),
          GraphQLField("shares", type: .nonNull(.scalar(Int.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, createdAt: String, body: String? = nil, user: User, media: Medium, views: Int, liked: Bool, likes: Int, comments: Int, shares: Int) {
        self.init(unsafeResultMap: ["__typename": "Post", "id": id, "createdAt": createdAt, "body": body, "user": user.resultMap, "media": media.resultMap, "views": views, "liked": liked, "likes": likes, "comments": comments, "shares": shares])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var createdAt: String {
        get {
          return resultMap["createdAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var body: String? {
        get {
          return resultMap["body"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "body")
        }
      }

      public var user: User {
        get {
          return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "user")
        }
      }

      public var media: Medium {
        get {
          return Medium(unsafeResultMap: resultMap["media"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "media")
        }
      }

      public var views: Int {
        get {
          return resultMap["views"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "views")
        }
      }

      public var liked: Bool {
        get {
          return resultMap["liked"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "liked")
        }
      }

      public var likes: Int {
        get {
          return resultMap["likes"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "likes")
        }
      }

      public var comments: Int {
        get {
          return resultMap["comments"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "comments")
        }
      }

      public var shares: Int {
        get {
          return resultMap["shares"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "shares")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var post: Post {
          get {
            return Post(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("username", type: .nonNull(.scalar(String.self))),
            GraphQLField("avatar", type: .nonNull(.scalar(String.self))),
            GraphQLField("followed", type: .nonNull(.scalar(Bool.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, username: String, avatar: String, followed: Bool) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "username": username, "avatar": avatar, "followed": followed])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var username: String {
          get {
            return resultMap["username"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "username")
          }
        }

        public var avatar: String {
          get {
            return resultMap["avatar"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "avatar")
          }
        }

        public var followed: Bool {
          get {
            return resultMap["followed"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "followed")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var user: User {
            get {
              return User(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Medium: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Media"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("url", type: .nonNull(.scalar(String.self))),
            GraphQLField("urlMedium", type: .scalar(String.self)),
            GraphQLField("gif", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, url: String, urlMedium: String? = nil, gif: String) {
          self.init(unsafeResultMap: ["__typename": "Media", "id": id, "url": url, "urlMedium": urlMedium, "gif": gif])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var url: String {
          get {
            return resultMap["url"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "url")
          }
        }

        public var urlMedium: String? {
          get {
            return resultMap["urlMedium"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "urlMedium")
          }
        }

        public var gif: String {
          get {
            return resultMap["gif"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "gif")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var media: Media {
            get {
              return Media(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class ForYouFeedQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query forYouFeed($input: ForYouFeedInput) {
      forYouFeed(input: $input) {
        __typename
        ...Post
        liked
        likes
        comments
        shares
      }
    }
    """

  public let operationName: String = "forYouFeed"

  public let operationIdentifier: String? = "350fd51191e1d4500e039ee2b085ec3f5272ae031b97c28d1e248c4c3ecce148"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + Post.fragmentDefinition)
    document.append("\n" + User.fragmentDefinition)
    document.append("\n" + Media.fragmentDefinition)
    return document
  }

  public var input: ForYouFeedInput?

  public init(input: ForYouFeedInput? = nil) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("forYouFeed", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.list(.nonNull(.object(ForYouFeed.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(forYouFeed: [ForYouFeed]) {
      self.init(unsafeResultMap: ["__typename": "Query", "forYouFeed": forYouFeed.map { (value: ForYouFeed) -> ResultMap in value.resultMap }])
    }

    public var forYouFeed: [ForYouFeed] {
      get {
        return (resultMap["forYouFeed"] as! [ResultMap]).map { (value: ResultMap) -> ForYouFeed in ForYouFeed(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: ForYouFeed) -> ResultMap in value.resultMap }, forKey: "forYouFeed")
      }
    }

    public struct ForYouFeed: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Post"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("body", type: .scalar(String.self)),
          GraphQLField("user", type: .nonNull(.object(User.selections))),
          GraphQLField("media", type: .nonNull(.object(Medium.selections))),
          GraphQLField("views", type: .nonNull(.scalar(Int.self))),
          GraphQLField("liked", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("likes", type: .nonNull(.scalar(Int.self))),
          GraphQLField("comments", type: .nonNull(.scalar(Int.self))),
          GraphQLField("shares", type: .nonNull(.scalar(Int.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, createdAt: String, body: String? = nil, user: User, media: Medium, views: Int, liked: Bool, likes: Int, comments: Int, shares: Int) {
        self.init(unsafeResultMap: ["__typename": "Post", "id": id, "createdAt": createdAt, "body": body, "user": user.resultMap, "media": media.resultMap, "views": views, "liked": liked, "likes": likes, "comments": comments, "shares": shares])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var createdAt: String {
        get {
          return resultMap["createdAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var body: String? {
        get {
          return resultMap["body"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "body")
        }
      }

      public var user: User {
        get {
          return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "user")
        }
      }

      public var media: Medium {
        get {
          return Medium(unsafeResultMap: resultMap["media"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "media")
        }
      }

      public var views: Int {
        get {
          return resultMap["views"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "views")
        }
      }

      public var liked: Bool {
        get {
          return resultMap["liked"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "liked")
        }
      }

      public var likes: Int {
        get {
          return resultMap["likes"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "likes")
        }
      }

      public var comments: Int {
        get {
          return resultMap["comments"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "comments")
        }
      }

      public var shares: Int {
        get {
          return resultMap["shares"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "shares")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var post: Post {
          get {
            return Post(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("username", type: .nonNull(.scalar(String.self))),
            GraphQLField("avatar", type: .nonNull(.scalar(String.self))),
            GraphQLField("followed", type: .nonNull(.scalar(Bool.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, username: String, avatar: String, followed: Bool) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "username": username, "avatar": avatar, "followed": followed])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var username: String {
          get {
            return resultMap["username"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "username")
          }
        }

        public var avatar: String {
          get {
            return resultMap["avatar"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "avatar")
          }
        }

        public var followed: Bool {
          get {
            return resultMap["followed"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "followed")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var user: User {
            get {
              return User(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Medium: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Media"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("url", type: .nonNull(.scalar(String.self))),
            GraphQLField("urlMedium", type: .scalar(String.self)),
            GraphQLField("gif", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, url: String, urlMedium: String? = nil, gif: String) {
          self.init(unsafeResultMap: ["__typename": "Media", "id": id, "url": url, "urlMedium": urlMedium, "gif": gif])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var url: String {
          get {
            return resultMap["url"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "url")
          }
        }

        public var urlMedium: String? {
          get {
            return resultMap["urlMedium"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "urlMedium")
          }
        }

        public var gif: String {
          get {
            return resultMap["gif"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "gif")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var media: Media {
            get {
              return Media(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public struct User: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment User on User {
      __typename
      id
      username
      avatar
      followed
    }
    """

  public static let possibleTypes: [String] = ["User"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(Int.self))),
      GraphQLField("username", type: .nonNull(.scalar(String.self))),
      GraphQLField("avatar", type: .nonNull(.scalar(String.self))),
      GraphQLField("followed", type: .nonNull(.scalar(Bool.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: Int, username: String, avatar: String, followed: Bool) {
    self.init(unsafeResultMap: ["__typename": "User", "id": id, "username": username, "avatar": avatar, "followed": followed])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: Int {
    get {
      return resultMap["id"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var username: String {
    get {
      return resultMap["username"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "username")
    }
  }

  public var avatar: String {
    get {
      return resultMap["avatar"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "avatar")
    }
  }

  public var followed: Bool {
    get {
      return resultMap["followed"]! as! Bool
    }
    set {
      resultMap.updateValue(newValue, forKey: "followed")
    }
  }
}

public struct Media: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment Media on Media {
      __typename
      id
      url
      urlMedium
      gif
    }
    """

  public static let possibleTypes: [String] = ["Media"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(Int.self))),
      GraphQLField("url", type: .nonNull(.scalar(String.self))),
      GraphQLField("urlMedium", type: .scalar(String.self)),
      GraphQLField("gif", type: .nonNull(.scalar(String.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: Int, url: String, urlMedium: String? = nil, gif: String) {
    self.init(unsafeResultMap: ["__typename": "Media", "id": id, "url": url, "urlMedium": urlMedium, "gif": gif])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: Int {
    get {
      return resultMap["id"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var url: String {
    get {
      return resultMap["url"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "url")
    }
  }

  public var urlMedium: String? {
    get {
      return resultMap["urlMedium"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "urlMedium")
    }
  }

  public var gif: String {
    get {
      return resultMap["gif"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "gif")
    }
  }
}

public struct Post: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment Post on Post {
      __typename
      id
      createdAt
      body
      user {
        __typename
        ...User
      }
      media {
        __typename
        ...Media
      }
      views
    }
    """

  public static let possibleTypes: [String] = ["Post"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(Int.self))),
      GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
      GraphQLField("body", type: .scalar(String.self)),
      GraphQLField("user", type: .nonNull(.object(User.selections))),
      GraphQLField("media", type: .nonNull(.object(Medium.selections))),
      GraphQLField("views", type: .nonNull(.scalar(Int.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: Int, createdAt: String, body: String? = nil, user: User, media: Medium, views: Int) {
    self.init(unsafeResultMap: ["__typename": "Post", "id": id, "createdAt": createdAt, "body": body, "user": user.resultMap, "media": media.resultMap, "views": views])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: Int {
    get {
      return resultMap["id"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var createdAt: String {
    get {
      return resultMap["createdAt"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "createdAt")
    }
  }

  public var body: String? {
    get {
      return resultMap["body"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "body")
    }
  }

  public var user: User {
    get {
      return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "user")
    }
  }

  public var media: Medium {
    get {
      return Medium(unsafeResultMap: resultMap["media"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "media")
    }
  }

  public var views: Int {
    get {
      return resultMap["views"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "views")
    }
  }

  public struct User: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["User"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("username", type: .nonNull(.scalar(String.self))),
        GraphQLField("avatar", type: .nonNull(.scalar(String.self))),
        GraphQLField("followed", type: .nonNull(.scalar(Bool.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: Int, username: String, avatar: String, followed: Bool) {
      self.init(unsafeResultMap: ["__typename": "User", "id": id, "username": username, "avatar": avatar, "followed": followed])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: Int {
      get {
        return resultMap["id"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var username: String {
      get {
        return resultMap["username"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "username")
      }
    }

    public var avatar: String {
      get {
        return resultMap["avatar"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "avatar")
      }
    }

    public var followed: Bool {
      get {
        return resultMap["followed"]! as! Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "followed")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var user: User {
        get {
          return User(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }

  public struct Medium: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Media"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("url", type: .nonNull(.scalar(String.self))),
        GraphQLField("urlMedium", type: .scalar(String.self)),
        GraphQLField("gif", type: .nonNull(.scalar(String.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: Int, url: String, urlMedium: String? = nil, gif: String) {
      self.init(unsafeResultMap: ["__typename": "Media", "id": id, "url": url, "urlMedium": urlMedium, "gif": gif])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: Int {
      get {
        return resultMap["id"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var url: String {
      get {
        return resultMap["url"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "url")
      }
    }

    public var urlMedium: String? {
      get {
        return resultMap["urlMedium"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "urlMedium")
      }
    }

    public var gif: String {
      get {
        return resultMap["gif"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "gif")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var media: Media {
        get {
          return Media(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }
}

public struct Comment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment Comment on Comment {
      __typename
      id
      createdAt
      body
      user {
        __typename
        ...User
      }
    }
    """

  public static let possibleTypes: [String] = ["Comment"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(Int.self))),
      GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
      GraphQLField("body", type: .nonNull(.scalar(String.self))),
      GraphQLField("user", type: .nonNull(.object(User.selections))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: Int, createdAt: String, body: String, user: User) {
    self.init(unsafeResultMap: ["__typename": "Comment", "id": id, "createdAt": createdAt, "body": body, "user": user.resultMap])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: Int {
    get {
      return resultMap["id"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var createdAt: String {
    get {
      return resultMap["createdAt"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "createdAt")
    }
  }

  public var body: String {
    get {
      return resultMap["body"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "body")
    }
  }

  public var user: User {
    get {
      return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "user")
    }
  }

  public struct User: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["User"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("username", type: .nonNull(.scalar(String.self))),
        GraphQLField("avatar", type: .nonNull(.scalar(String.self))),
        GraphQLField("followed", type: .nonNull(.scalar(Bool.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: Int, username: String, avatar: String, followed: Bool) {
      self.init(unsafeResultMap: ["__typename": "User", "id": id, "username": username, "avatar": avatar, "followed": followed])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: Int {
      get {
        return resultMap["id"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var username: String {
      get {
        return resultMap["username"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "username")
      }
    }

    public var avatar: String {
      get {
        return resultMap["avatar"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "avatar")
      }
    }

    public var followed: Bool {
      get {
        return resultMap["followed"]! as! Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "followed")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var user: User {
        get {
          return User(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }
}
