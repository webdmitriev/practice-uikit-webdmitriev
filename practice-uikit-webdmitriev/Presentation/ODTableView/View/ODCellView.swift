//
//  ODCellView.swift
//  practice-uikit-webdmitriev
//
//  Created by Олег Дмитриев on 21.08.2025.
//

import UIKit

final class ODCellView: UIView {
    
    private let separatorView: UIView = UIView()
    
    private let label: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Methods
    private func setupUI() {
        self.backgroundColor = .blue.withAlphaComponent(0.3)
        
        separatorView.backgroundColor = .white
        separatorView.frame = CGRect(x: 0, y: frame.size.height - 1, width: frame.size.width, height: 1)
        self.addSubview(separatorView)
        

        label.frame = self.bounds
        label.textColor = .white
        label.textAlignment = .center
        self.addSubview(label)
    }
    
    func configure(_ text: String) {
        label.text = text
    }
}
