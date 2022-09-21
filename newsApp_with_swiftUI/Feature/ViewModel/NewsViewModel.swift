//
//  NewsViewModel.swift
//  newsApp_with_swiftUI
//
//  Created by Tuğrul Özpehlivan on 20.09.2022.
//

import Foundation
import SwiftUI


class NewsViewModel : ObservableObject {
    
    @Published var news = [Results]()
    @Published var pickerItems = [CategoryTags.generalNews.rawValue,CategoryTags.economyNews.rawValue,CategoryTags.technologyNews.rawValue]
    
    let service : NewsServiceProtocol
    
    init(service : NewsServiceProtocol) {
        self.service = service
    }
    
    func getNews(category: String) {
        service.getNews(category: category) { result in
            switch result {
            case .success(let datas):
                DispatchQueue.main.async {
                    self.news = datas ?? []
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
