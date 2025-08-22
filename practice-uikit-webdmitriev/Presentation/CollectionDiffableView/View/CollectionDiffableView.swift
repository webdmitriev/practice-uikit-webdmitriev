//
//  CollectionDiffableView.swift
//  practice-uikit-webdmitriev
//
//  Created by Олег Дмитриев on 22.08.2025.
//

import UIKit

final class CollectionDiffableView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // Methods
    private func setupUI() {
        view.backgroundColor = .brown.withAlphaComponent(0.4)
    }
    
}
