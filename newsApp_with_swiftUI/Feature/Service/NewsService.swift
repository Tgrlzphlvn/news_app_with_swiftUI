//
//  NewsService.swift
//  newsApp_with_swiftUI
//
//  Created by Tuğrul Özpehlivan on 20.09.2022.
//

import Foundation


class NewsService : NewsServiceProtocol {
    
    func getNews(category : String, completion : @escaping (Result<[Results]?, Error>) -> Void) {
        let request = NSMutableURLRequest(url: NSURL(string: ServicePlugins.url + category)! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = ServicePlugins.getMethod
        request.allHTTPHeaderFields = ServicePlugins.headers
        
        URLSession.shared.dataTask(with: request as URLRequest) { data, _, error in
                        
            guard let data = data , error == nil else {
                return completion(.failure(ServiceErrors.networkError))
            }
            
            guard let results = try? JSONDecoder().decode(News.self, from: data) else {
                return completion(.failure(ServiceErrors.dataParsingError))
            }
            
            completion(.success(results.result))
        }.resume()
    }
}
