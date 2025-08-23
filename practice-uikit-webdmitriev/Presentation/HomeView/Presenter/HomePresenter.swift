//
//  HomePresenter.swift
//  practice-uikit-webdmitriev
//
//  Created by Олег Дмитриев on 23.08.2025.
//

import Foundation

protocol HomeViewPresenterProtocol: AnyObject {
    var view: HomeViewControllerProtocol? { get set }
    func fetchPosts()
}

final class HomePresenter: HomeViewPresenterProtocol {
    
    weak var view: HomeViewControllerProtocol?
    
    init(view: HomeViewControllerProtocol? = nil) {
        self.view = view
    }
    
    func fetchPosts() {
        print("HomePresenter fetchPosts")
    }
}
