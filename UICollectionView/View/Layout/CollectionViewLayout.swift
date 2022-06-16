//
//  CollectionViewLayout.swift
//  UICollectionView
//
//  Created by Виталий Таран on 16.06.2022.
//

import UIKit

class CollectionViewLayout {
    static func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            switch sectionNumber {
            case 0:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Metric.fullWidthHeight), heightDimension: .fractionalHeight(Metric.fullWidthHeight))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets.trailing = Metric.itemContentInsets
                
                let horizontalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Metric.fullWidthHeight), heightDimension: .fractionalHeight(Metric.sixtyPercentHeight))
                let containerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Metric.ninetyPercentWidth), heightDimension: .estimated(Metric.estFirstGroupHeight))
                
                let horizontalGroupOne = NSCollectionLayoutGroup.horizontal(layoutSize: horizontalGroupSize, subitem: item, count: Metric.numberOfItemsInHorizontalGroup)
                let horizontalGroupTwo = NSCollectionLayoutGroup.horizontal(layoutSize: horizontalGroupSize, subitem: item, count: Metric.numberOfItemsInHorizontalGroup)
                let containerGroup = NSCollectionLayoutGroup.vertical(layoutSize: containerGroupSize, subitems: [horizontalGroupOne, horizontalGroupTwo])
                
                containerGroup.interItemSpacing = .fixed(Metric.firstContainerItemSpacing)
                
                let section = NSCollectionLayoutSection(group: containerGroup)
                section.orthogonalScrollingBehavior = .groupPaging
                section.contentInsets = .init(top: .zero, leading: Metric.sectionContentInsets, bottom: Metric.sectionContentInsets, trailing: Metric.sectionContentInsets)
                
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(Metric.fullWidthHeight), heightDimension: .absolute(Metric.headerHeight)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
                ]

                return section
            case 1:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Metric.fullWidthHeight), heightDimension: .fractionalHeight(Metric.fullWidthHeight))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets.trailing = Metric.itemContentInsets
                
                let horizontalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Metric.ninetyPercentWidth), heightDimension: .estimated(Metric.secondSectionHorizontalGroupHeight))
                let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: horizontalGroupSize, subitem: item, count: Metric.numberOfItemsInHorizontalGroup)
                
                let section = NSCollectionLayoutSection(group: horizontalGroup)
                section.orthogonalScrollingBehavior = .groupPaging
                section.contentInsets = .init(top: .zero, leading: Metric.sectionContentInsets, bottom: Metric.secondSectionBottomInset, trailing: Metric.sectionContentInsets)
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(Metric.fullWidthHeight), heightDimension: .absolute(Metric.headerHeight)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
                ]

                return section
            case 2, 3:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Metric.fullWidthHeight), heightDimension: .fractionalHeight(Metric.fullWidthHeight))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets.bottom = Metric.itemContentInsets
                        
                let verticalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Metric.fullWidthHeight), heightDimension: .estimated(Metric.estListCellHeight))
                let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: verticalGroupSize, subitem: item, count: Metric.numberOfItemsInVerticalGroup)
                            
                let section = NSCollectionLayoutSection(group: verticalGroup)
                section.contentInsets = .init(top: .zero, leading: Metric.sectionContentInsets, bottom: Metric.sectionContentInsets, trailing: Metric.sectionContentInsets)
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(Metric.fullWidthHeight), heightDimension: .absolute(Metric.headerHeight)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
                ]
                return section
            default:
                return nil
            }
        }
    }
}



