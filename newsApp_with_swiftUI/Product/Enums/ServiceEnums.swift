//
//  ServiceEnums.swift
//  newsApp_with_swiftUI
//
//  Created by Tuğrul Özpehlivan on 20.09.2022.
//

import Foundation


enum CategoryTags : String {
    case generalNews = "general"
    case economyNews = "economy"
    case technologyNews = "technology"
}


enum ServiceErrors : Error {
    case networkError
    case dataParsingError
}

struct ServicePlugins {
    static let headers = ["content-type": "application/json", "authorization" : "apikey https://collectapi.com/"]
    static let getMethod = "GET"
    static let url = "https://api.collectapi.com/news/getNews?country=tr&tag="
}

