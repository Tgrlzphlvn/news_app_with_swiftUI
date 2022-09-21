//
//  NewsServiceProtocol.swift
//  newsApp_with_swiftUI
//
//  Created by Tuğrul Özpehlivan on 20.09.2022.
//

import Foundation


protocol NewsServiceProtocol {
    func getNews(category : String, completion : @escaping (Result<[Results]?, Error>) -> Void)
}
