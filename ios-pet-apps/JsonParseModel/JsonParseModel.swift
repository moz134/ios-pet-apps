//
//  JsonParseModel.swift
//  ios-pet-apps
//
//  Created by Md Mozammil on 21/11/22.
//

import Foundation

struct PetsResponseModel: Decodable {
    let pets: [PetDetailsResponseModel]
}

struct PetDetailsResponseModel: Decodable {
    let imageURL: String
    let title: String
    let contentURL: String

    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case title
        case contentURL = "content_url"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.imageURL = try container.decode(String.self, forKey: .imageURL)
        self.contentURL = try container.decode(String.self, forKey: .contentURL)
    }
}

struct OpeningTimingResponse: Decodable {
    let settings: Settings
}
struct Settings: Decodable {
    let workHours: String
}
