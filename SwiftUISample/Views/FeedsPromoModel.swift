//
//  FeedsPromoModel.swift
//  Pods
//
//  Created by Elka Belaya on 30.04.2021.
//
//https://rutube.ru/api/feeds/promo/253?style=grid&name=%D0%9A%D0%B0%D1%82%D0%B0%D0%BB%D0%BE%D0%B3
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
    let title, resultDescription, target: String
    let width, height: Int
    let createdTs, bgcolor: String
    let noStyle: JSONNull?
    let counterURL: String
    let targetBlank: JSONNull?
    let id: Int
    let extraParams: ExtraParams
    let picture: String
    let labels: [JSONAny]

    enum CodingKeys: String, CodingKey {
        case title
        case resultDescription = "description"
        case target, width, height
        case createdTs = "created_ts"
        case bgcolor
        case noStyle = "no_style"
        case counterURL = "counter_url"
        case targetBlank = "target_blank"
        case id
        case extraParams = "extra_params"
        case picture, labels
    }
}

// MARK: - ExtraParams
struct ExtraParams: Codable {
}
