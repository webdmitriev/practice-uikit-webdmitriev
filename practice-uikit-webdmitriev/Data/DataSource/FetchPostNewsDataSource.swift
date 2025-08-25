//
//  FetchPostNewsDataSource.swift
//  practice-uikit-webdmitriev
//
//  Created by Олег Дмитриев on 25.08.2025.
//

import Foundation

protocol FetchPostNewsDataSource {
    func fetchPostNews() async throws -> [News]
}
