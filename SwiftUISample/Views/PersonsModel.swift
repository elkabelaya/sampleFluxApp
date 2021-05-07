//
//  PersonsModel.swift
//  Pods
//
//  Created by Elka Belaya on 30.04.2021.
//
//https://rutube.ru/api/video/person/23348965/?name=%D0%9D%D0%AC%D0%AE%D0%9C&noSubs=true&sort=publication_d
//такой же как и тэги!
struct Welcome: Codable {
    let hasNext: Bool
    let next: String
    let previous: JSONNull?
    let page, perPage: Int
    let results: [Result]
    let numPages: Int

    enum CodingKeys: String, CodingKey {
        case hasNext = "has_next"
        case next, previous, page
        case perPage = "per_page"
        case results
        case numPages = "num_pages"
    }
}

// MARK: - Result
struct Result: Codable {
    let id: String
    let thumbnailURL: String
    let videoURL: String
    let duration: Int
    let pictureURL: String
    let author: Author
    let pgRating: PGRating
    let isClub, isClassic, isPaid: Bool
    let productID: JSONNull?
    let allowRutube: Bool
    let title, resultDescription: String
    let isAudio: Bool
    let createdTs: String
    let trackID, hits: Int
    let isLivestream: Bool
    let lastUpdateTs: String
    let streamType: JSONNull?
    let isAdult: Bool
    let publicationTs: String
    let embedURL: String
    let category: Category
    let isOfficial: Bool
    let actionReason: ActionReason
    let commentEditors, html: String
    let feedURL: String
    let pepper: JSONNull?
    let isHidden, hasHighQuality, isDeleted: Bool
    let sourceURL: String
    let isExternal: Bool
    let rutubePoster: JSONNull?
    let feedName: FeedNameEnum

    enum CodingKeys: String, CodingKey {
        case id
        case thumbnailURL = "thumbnail_url"
        case videoURL = "video_url"
        case duration
        case pictureURL = "picture_url"
        case author
        case pgRating = "pg_rating"
        case isClub = "is_club"
        case isClassic = "is_classic"
        case isPaid = "is_paid"
        case productID = "product_id"
        case allowRutube = "allow_rutube"
        case title
        case resultDescription = "description"
        case isAudio = "is_audio"
        case createdTs = "created_ts"
        case trackID = "track_id"
        case hits
        case isLivestream = "is_livestream"
        case lastUpdateTs = "last_update_ts"
        case streamType = "stream_type"
        case isAdult = "is_adult"
        case publicationTs = "publication_ts"
        case embedURL = "embed_url"
        case category
        case isOfficial = "is_official"
        case actionReason = "action_reason"
        case commentEditors = "comment_editors"
        case html
        case feedURL = "feed_url"
        case pepper
        case isHidden = "is_hidden"
        case hasHighQuality = "has_high_quality"
        case isDeleted = "is_deleted"
        case sourceURL = "source_url"
        case isExternal = "is_external"
        case rutubePoster = "rutube_poster"
        case feedName = "feed_name"
    }
}

// MARK: - ActionReason
struct ActionReason: Codable {
    let id: Int
    let name: String
}

// MARK: - Author
struct Author: Codable {
    let id: Int
    let name: FeedNameEnum
    let avatarURL: String
    let siteURL: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case avatarURL = "avatar_url"
        case siteURL = "site_url"
    }
}

enum FeedNameEnum: String, Codable {
    case ньюм = "НЬЮМ"
}

// MARK: - Category
struct Category: Codable {
    let id: Int
    let categoryURL: String
    let name: CategoryName

    enum CodingKeys: String, CodingKey {
        case id
        case categoryURL = "category_url"
        case name
    }
}

enum CategoryName: String, Codable {
    case образование = "Образование"
    case развлечения = "Развлечения"
    case разное = "Разное"
}

// MARK: - PGRating
struct PGRating: Codable {
    let age: Int
    let logo: String
}

