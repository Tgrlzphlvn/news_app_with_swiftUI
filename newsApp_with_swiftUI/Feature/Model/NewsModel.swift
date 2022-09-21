//
//  NewsModel.swift
//  newsApp_with_swiftUI
//
//  Created by Tuğrul Özpehlivan on 20.09.2022.
//

import Foundation


// MARK: - News
struct News: Codable {
    let success: Bool?
    let result: [Results]?
}

// MARK: - Result
struct Results: Codable, Identifiable {
    var id = UUID()
    let key: String?
    let url: String?
    let resultDescription: String?
    let image: String?
    let name, source: String?

    enum CodingKeys: String, CodingKey {
        case key, url
        case resultDescription = "description"
        case image, name, source
    }
}
