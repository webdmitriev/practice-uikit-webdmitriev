//
//  FetchPostNewsRepositoryImpl.swift
//  practice-uikit-webdmitriev
//
//  Created by Олег Дмитриев on 25.08.2025.
//

import Foundation

class FetchPostNewsRepositoryImpl: FetchPostNewsRepository {
    
    private var dataSource: FetchPostNewsDataSource
    
    init(dataSource: FetchPostNewsDataSource) {
        self.dataSource = dataSource
    }
    
    func fetchPostNews() async throws -> [News] {
        try await dataSource.fetchPostNews()
    }
}
