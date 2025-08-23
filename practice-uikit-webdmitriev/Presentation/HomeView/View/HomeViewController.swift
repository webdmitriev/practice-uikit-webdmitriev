//
//  HomeController.swift
//  practice-uikit-webdmitriev
//
//  Created by Олег Дмитриев on 21.08.2025.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {
    func fetchPosts()
}

final class HomeViewController: UIViewController, HomeViewControllerProtocol {
    var presenter: HomeViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
        
        fetchPosts()
    }

    // Methods
    func fetchPosts() {
        print("HomeViewController fetchPosts")
    }

}

