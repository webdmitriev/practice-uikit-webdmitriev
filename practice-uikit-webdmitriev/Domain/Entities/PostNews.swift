//
//  PostNews.swift
//  practice-uikit-webdmitriev
//
//  Created by Олег Дмитриев on 25.08.2025.
//

import Foundation

struct PostNews: Codable, Hashable {
    let articles: [News]
}

struct News: Codable, Hashable {
    let author: String?
    let title: String?
    let description: String?
    let publishedAt: String
    let urlToImage: String?
}
