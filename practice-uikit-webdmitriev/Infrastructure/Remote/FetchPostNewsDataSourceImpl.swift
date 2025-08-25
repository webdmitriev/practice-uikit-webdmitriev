//
//  FetchPostNewsDataSourceImpl.swift
//  practice-uikit-webdmitriev
//
//  Created by Олег Дмитриев on 25.08.2025.
//

import Foundation

class FetchPostNewsDataSourceImpl: FetchPostNewsDataSource {

    func fetchPostNews() async throws -> [News] {
        let apiKey = "90d71b4d09934e91b45c675b8fb82a09"
        let urlString = "https://newsapi.org/v2/everything?q=tesla&pageSize=5&apiKey=\(apiKey)"

        guard let url = URL(string: urlString) else { return [] }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = try JSONDecoder().decode(PostNews.self, from: data)
        
        return decoder.articles
    }

}
