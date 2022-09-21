//
//  ContentView.swift
//  newsApp_with_swiftUI
//
//  Created by Tuğrul Özpehlivan on 20.09.2022.
//

import SwiftUI

struct NewsView: View {
    @ObservedObject var viewModel : NewsViewModel
    
    @State private var selectedItem = CategoryTags.generalNews.rawValue
    
    init() {
        self.viewModel = NewsViewModel(service: NewsService())
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.news, id: \.id) { item in
                NewsCell(news: item)
            }
            .toolbar {
                Picker("Kategoriler", selection: $selectedItem) {
                    ForEach(viewModel.pickerItems, id: \.self) { item in
                        Text(item).onAppear {
                            viewModel.getNews(category: item)

                        }
                    }
                }
            }
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}



