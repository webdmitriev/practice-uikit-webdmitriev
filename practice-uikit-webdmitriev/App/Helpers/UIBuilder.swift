//
//  UIBuilder.swift
//  practice-uikit-webdmitriev
//
//  Created by Олег Дмитриев on 23.08.2025.
//

import UIKit

class UIBuilder {
    
    let offset: CGFloat = 16
    
    enum FontSize: CGFloat {
       case fz14 = 14
       case fz16 = 16
       case fz18 = 18
       case fz20 = 20
       case fz22 = 22
   }
   
    func addLabel(_ text: String, fz: FontSize = .fz16, fw: UIFont.Weight = .regular, alignment: NSTextAlignment = .left,
                  lines: Int = 0, color: UIColor = .black) -> UILabel {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       
       label.text = text
       
       label.font = UIFont.systemFont(ofSize: fz.rawValue, weight: fw)
       label.textAlignment = alignment
       label.numberOfLines = lines
       
       label.textColor = color
       
       return label
   }
    
}
