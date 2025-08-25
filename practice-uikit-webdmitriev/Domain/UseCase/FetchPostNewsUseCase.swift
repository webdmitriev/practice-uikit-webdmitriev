//
//  FetchPostNewsUseCase.swift
//  practice-uikit-webdmitriev
//
//  Created by Олег Дмитриев on 25.08.2025.
//

import Foundation

protocol FetchPostNewsUseCaseProtocol {
    func execute() async throws -> [News]
}

class FetchPostNewsUseCase: FetchPostNewsUseCaseProtocol {
    
    private let fetchPostNewsRepo: FetchPostNewsRepository
    
    init(fetchPostNewsRepo: FetchPostNewsRepository) {
        self.fetchPostNewsRepo = fetchPostNewsRepo
    }
    
    func execute() async throws -> [News] {
        try await fetchPostNewsRepo.fetchPostNews()
    }
}
