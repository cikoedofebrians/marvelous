//
//  Character.swift
//  marvelous
//
//  Created by Ciko Edo Febrian on 27/06/23.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let characterResponse = try? JSONDecoder().decode(CharacterResponse.self, from: jsonData)

import Foundation

// MARK: - CharacterResponse
struct CharacterResponse: Codable {
//    let code: Int
    let data: DataClass
}

//// MARK: - DataClass
struct DataClass: Codable {
//    let offset, limit, total, count: Int
    let results: [Character]
}
//
//// MARK: - Result
struct Character: Codable {
    let id: Int
    let name, description: String
//    let modified: Date
    let thumbnail: Thumbnail
//    let resourceURI: String
//    let comics, series: Comics
//    let stories: Stories
//    let events: Comics
    let urls: [URLElement]
}
//
//// MARK: - Comics
//struct Comics: Codable {
//    let available: Int
//    let collectionURI: String
//    let items: [ComicsItem]
//    let returned: Int
//}
//
//// MARK: - ComicsItem
//struct ComicsItem: Codable {
//    let resourceURI: String
//    let name: String
//}
//
//// MARK: - Stories
//struct Stories: Codable {
//    let available: Int
//    let collectionURI: String
//    let items: [StoriesItem]
//    let returned: Int
//}
//
//// MARK: - StoriesItem
//struct StoriesItem: Codable {
//    let resourceURI: String
//    let name: String
//    let type: TypeEnum
//}
//
//enum TypeEnum: String, Codable {
//    case cover = "cover"
//    case interiorStory = "interiorStory"
//}
//
//// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String
    let fileExtension: String

    private enum CodingKeys: String, CodingKey {
            case path
            case fileExtension = "extension"
        }
}
//
//// MARK: - URLElement
struct URLElement: Codable {
    let type: String
    let url: String
}
