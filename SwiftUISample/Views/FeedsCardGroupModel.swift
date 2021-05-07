//
//  FeedsCardGroupModel.swift
//  Pods
//
//  Created by Elka Belaya on 30.04.2021.
//
//https://rutube.ru/api/feeds/cardgroup/1150?link=%2Ffeeds%2Fmovies%2F&name=%D0%9F%D0%BE%D0%BF%D1%83%D0%BB%D1%8F%D1%80%D0%BD%D1%8B%D0%B5+%D1%84%D0%B8%D0%BB%D1%8C%D0%BC%D1%8B&noSubs=true
struct Welcome: Codable {
    let hasNext: Bool
    let next: String
    let previous: JSONNull?
    let page, perPage: Int
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case hasNext = "has_next"
        case next, previous, page
        case perPage = "per_page"
        case results
    }
}

// MARK: - Result
struct Result: Codable {
    let id: Int
    let contentType: ContentType
    let objectID: Int
    let object: Object
    let isAdult: Bool
    let lastUpdatedTs: String

    enum CodingKeys: String, CodingKey {
        case id
        case contentType = "content_type"
        case objectID = "object_id"
        case object
        case isAdult = "is_adult"
        case lastUpdatedTs = "last_updated_ts"
    }
}

// MARK: - ContentType
struct ContentType: Codable {
    let id: Int
    let appLabel: AppLabel
    let model: Model

    enum CodingKeys: String, CodingKey {
        case id
        case appLabel = "app_label"
        case model
    }
}

enum AppLabel: String, Codable {
    case metainfo = "metainfo"
}

enum Model: String, Codable {
    case tv = "tv"
}

// MARK: - Object
struct Object: Codable {
    let id: Int
    let name, objectDescription: String
    let canSubscribe: Bool
    let type: TypeClass
    let picture: String
    let absoluteURL: String
    let icon: String
    let subscribersCount: Int
    let content, viewURL, subscriptionURL: String
    let age: Age
    let isPaid: Bool
    let images, countries: [JSONAny]
    let showAge: Bool
    let originalTitle: String
    let generalTrailer, posterURL: JSONNull?
    let genres: [Genre]
    let yearStart: String
    let videoCount: Int
    let userChannelImage: JSONNull?
    let lastUpdatedTs: String
    let product: Int

    enum CodingKeys: String, CodingKey {
        case id, name
        case objectDescription = "description"
        case canSubscribe = "can_subscribe"
        case type, picture
        case absoluteURL = "absolute_url"
        case icon
        case subscribersCount = "subscribers_count"
        case content
        case viewURL = "view_url"
        case subscriptionURL = "subscription_url"
        case age
        case isPaid = "is_paid"
        case images, countries
        case showAge = "show_age"
        case originalTitle = "original_title"
        case generalTrailer = "general_trailer"
        case posterURL = "poster_url"
        case genres
        case yearStart = "year_start"
        case videoCount = "video_count"
        case userChannelImage = "user_channel_image"
        case lastUpdatedTs = "last_updated_ts"
        case product
    }
}

enum Age: String, Codable {
    case the12 = "12+"
    case the16 = "16+"
    case the18 = "18+"
    case the6 = "6+"
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}

// MARK: - TypeClass
struct TypeClass: Codable {
    let id: Int
    let name: Name
    let title: Title
}

enum Name: String, Codable {
    case movie = "movie"
}

enum Title: String, Codable {
    case фильм = "Фильм"
}

