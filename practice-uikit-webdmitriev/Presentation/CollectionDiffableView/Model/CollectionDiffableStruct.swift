//
//  CollectionDiffableStruct.swift
//  practice-uikit-webdmitriev
//
//  Created by Олег Дмитриев on 23.08.2025.
//

import Foundation

enum SectionType {
    case message
    case items
    case products
}

struct Items: Hashable, Identifiable {
    let id = UUID()
    let name: String
}

struct CollectionDiffableStruct: Hashable {
    let title: String
    let action: Bool
    let type: SectionType
    let items: [Items]
    
    static func mockData() -> [CollectionDiffableStruct] {
        [
            CollectionDiffableStruct(title: "Messages", action: true, type: .message, items: [
                Items(name: "msg1"),
                Items(name: "msg2"),
                Items(name: "msg3"),
                Items(name: "msg4"),
                Items(name: "msg5"),
                Items(name: "msg6"),
            ]),
            CollectionDiffableStruct(title: "Items", action: true, type: .items, items: [
                Items(name: "Item1"),
                Items(name: "Item2"),
                Items(name: "Item3"),
                Items(name: "Item4"),
                Items(name: "Item5"),
            ]),
            CollectionDiffableStruct(title: "Products", action: true, type: .products, items: [
                Items(name: "Item1"),
                Items(name: "Item2"),
                Items(name: "Item2"),
            ])
        ]
    }
}
