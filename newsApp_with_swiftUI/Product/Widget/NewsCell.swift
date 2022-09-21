//
//  NewsCell.swift
//  newsApp_with_swiftUI
//
//  Created by Tuğrul Özpehlivan on 20.09.2022.
//

import SwiftUI
import Kingfisher

struct NewsCell: View {
    
    var news : Results
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(news.source ?? "").bold().font(.title2).padding(10)
            Text(news.name ?? "").font(.caption).padding(5)
            KFImage(URL(string: news.image ?? "")).resizable().frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.25, alignment: .center).padding(5)
            Text(news.resultDescription ?? "").font(.title3)
        }
    }
}
