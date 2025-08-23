//
//  CollectionDiffableView.swift
//  practice-uikit-webdmitriev
//
//  Created by Олег Дмитриев on 22.08.2025.
//

import UIKit

final class CollectionDiffableView: UIViewController {
    
    private let items: [CollectionDiffableStruct] = CollectionDiffableStruct.mockData()
    
    // <section type, elements>
    private var dataSource: UICollectionViewDiffableDataSource<CollectionDiffableStruct, Items>!

    private lazy var collectionView: UICollectionView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell01")
        $0.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell02")
        $0.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell03")
        
        $0.register(CollectionDiffableHeader.self,
                    forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                    withReuseIdentifier: CollectionDiffableHeader.reuseID)
        
        $0.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: createLayout()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)

        createDataSource()
        createSnapShot()

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // 1 setup UICollectionViewCompositionalLayout
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { [weak self] section, _ in
            
            guard let self else { return nil }
            
            let currentSection = self.items[section].type
            
            switch currentSection {
            case .message:
                return self.createMessageSection()
            case .items:
                return self.createItemsSection()
            case .products:
                return self.createProductSection()
            }
        }
    }
    
    // 2 create dataSource
    private func createDataSource() {
        self.dataSource = UICollectionViewDiffableDataSource<CollectionDiffableStruct, Items>(collectionView: collectionView) { [weak self] (collectionView, indexPath, item) in
            let currentSection = self?.items[indexPath.section].type
            
            switch currentSection {
            case .message:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell01", for: indexPath)
                cell.contentView.backgroundColor = .brown
                return cell
            case .items:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell02", for: indexPath)
                cell.contentView.backgroundColor = .systemTeal
                return cell
            case .products:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell03", for: indexPath)
                cell.contentView.backgroundColor = .red.withAlphaComponent(0.3)
                return cell
            case .none:
                return UICollectionViewCell()
            }
        }
        
        self.dataSource.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            guard kind == UICollectionView.elementKindSectionHeader else { return UICollectionReusableView() }
            
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: CollectionDiffableHeader.reuseID,
                                                                         for: indexPath) as! CollectionDiffableHeader
            let section = self?.items[indexPath.section]
            header.titleCell.text = section?.title
            header.actionCell(isHide: section?.action ?? false)
            return header
        }
    }
    
    // 3 create snap shot
    private func createSnapShot() {
        var snapshot = NSDiffableDataSourceSnapshot<CollectionDiffableStruct, Items>()
        snapshot.appendSections(items)
 
        items.forEach { section in
            snapshot.appendItems(section.items, toSection: section)
        }
        
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

// Header
extension CollectionDiffableView {
    private func createHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
}

// Message Section
extension CollectionDiffableView {
    private func createMessageSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(80), heightDimension: .absolute(120)), repeatingSubitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 10
        section.contentInsets = .init(top: 0, leading: 10, bottom: 20, trailing: 10)
        
        section.boundarySupplementaryItems = [createHeader()]
        return section
    }
}

// Items Section
extension CollectionDiffableView {
    private func createItemsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .estimated(140)), repeatingSubitem: item, count: 2)
        group.interItemSpacing = .fixed(10)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 10
        section.contentInsets = .init(top: 0, leading: 10, bottom: 20, trailing: 10)
        
        section.boundarySupplementaryItems = [createHeader()]
        return section
    }
}

// Products Section
extension CollectionDiffableView {
    private func createProductSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(220)), repeatingSubitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = .init(top: 0, leading: 10, bottom: 20, trailing: 10)
        
        section.boundarySupplementaryItems = [createHeader()]
        return section
    }
}
