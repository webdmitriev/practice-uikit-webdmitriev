//
//  Builder.swift
//  practice-uikit-webdmitriev
//
//  Created by Олег Дмитриев on 23.08.2025.
//

import UIKit

class Builder {
    static func createHomeViewController() -> UIViewController {
        let view = HomeViewController()
        let presenter = HomePresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    static func createODTableView() -> UIViewController {
        let view = ODTableView()
        return view
    }
    
}
