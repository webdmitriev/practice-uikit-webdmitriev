//
//  HomePresenter.swift
//  practice-uikit-webdmitriev
//
//  Created by Олег Дмитриев on 23.08.2025.
//

import Foundation

protocol HomeViewPresenterProtocol: AnyObject {
    var view: HomeViewControllerProtocol? { get set }

    func viewDidLoad()
    func refreshData()
    var news: [News] { get }
    
}

final class HomePresenter: HomeViewPresenterProtocol {
    
    weak var view: HomeViewControllerProtocol?
    private let dataSource: FetchPostNewsDataSource
    private(set) var news: [News] = []
    
    init(view: HomeViewControllerProtocol, dataSource: FetchPostNewsDataSource = FetchPostNewsDataSourceImpl()) {
        self.view = view
        self.dataSource = dataSource
    }
    
    func viewDidLoad() {
        loadNews()
    }
    
    func refreshData() {
        loadNews()
    }
    
    private func loadNews() {
        Task { @MainActor in
            do {
                view?.showLoading(true)
                let fetchedNews = try await dataSource.fetchPostNews()
                self.news = fetchedNews
                view?.displayNews(fetchedNews)
                view?.showLoading(false)
            } catch {
                view?.showLoading(false)
                view?.showError(error.localizedDescription)
            }
        }
    }
}
