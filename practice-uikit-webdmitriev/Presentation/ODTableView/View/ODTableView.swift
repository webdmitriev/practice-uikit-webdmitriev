//
//  ODTableView.swift
//  practice-uikit-webdmitriev
//
//  Created by Олег Дмитриев on 21.08.2025.
//

import UIKit

final class ODTableView: UIViewController {
    
    private let scrollView = UIScrollView()
    
    private let countCells: Int = 30
    private let heightCell: Int = 58
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        configureCells()
    }
    
    // Methods
    private func setupUI() {
        self.scrollView.backgroundColor = .white
        self.scrollView.frame = self.view.frame
        self.scrollView.contentSize = CGSize(width: Int(self.view.frame.width), height: heightCell * countCells)
        
        view.addSubview(scrollView)
    }
    
    private func configureCells() {
        for idx in 0..<countCells {
            let cellView = ODCellView(frame: CGRect(x: 0, y: heightCell * idx, width: Int(scrollView.frame.size.width), height: heightCell))
            
            cellView.configure("Cell \(idx)")
            
            self.scrollView.addSubview(cellView)
        }
    }
    
}
