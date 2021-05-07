//
//  MetaInfoTvModel.swift
//  Pods
//
//  Created by Elka Belaya on 30.04.2021.
//
//https://rutube.ru/api/metainfo/tv/16229/video/?show_all=1&name=%D0%92%D0%B5%D0%B9%D0%BF%D0%B8%D0%BD%D0%B3+%D0%B8+%D1%82%D0%B0%D0%B1%D0%B0%D0%BA%D0%BE%D0%BA%D1%83%D1%80%D0%B5%D0%BD%D0%B8%D0%B5&noSubs=true&sort=publication_d

//похоже на теги, но более урезано
struct Welcome: Codable {
    let hasNext: Bool
    let next, previous: JSONNull?
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
    let feedURL: String
    let actionReason: ActionReason
    let isDeleted: Bool
    let feedName: String
    let season, episode, fts: Int
    let category: Category
    let type: TypeClass

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
        case feedURL = "feed_url"
        case actionReason = "action_reason"
        case isDeleted = "is_deleted"
        case feedName = "feed_name"
        case season, episode, fts, category, type
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
    let name: String
    let avatarURL: String
    let siteURL: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case avatarURL = "avatar_url"
        case siteURL = "site_url"
    }
}

