//
//  Constants.swift
//  UICollectionView
//
//  Created by Виталий Таран on 16.06.2022.
//

import UIKit

extension CollectionViewLayout {
    enum Metric {
        static let fullWidthHeight: CGFloat = 1
        static let itemContentInsets: CGFloat = 8
        static let sixtyPercentHeight: CGFloat = 0.6
        static let ninetyPercentWidth: CGFloat = 0.9
        static let estFirstGroupHeight: CGFloat = 350
        static let numberOfItemsInHorizontalGroup: Int = 2
        static let firstContainerItemSpacing: CGFloat = 8
        static let sectionContentInsets: CGFloat = 16
        static let headerHeight: CGFloat = 40
        static let secondSectionHorizontalGroupHeight: CGFloat = 175
        static let secondSectionBottomInset: CGFloat = 56
        static let estListCellHeight: CGFloat = 50
        static let numberOfItemsInVerticalGroup: Int = 1
    }
}

extension HeaderView {
    enum Metric {
        static let labelFontSize: CGFloat = 22
        static let borderThickness: CGFloat = 1
        static let widthAdjustment: CGFloat = 16
    }
    
    enum Strings {
        static let headerId: String = "headerId"
        static let seeAllButtonTitle: String = "See All"
    }
}

extension AlbumCollectionViewCell {
    enum Metric {
        static let cellImageCornerRadius: CGFloat = 5
        static let cellContentInset: CGFloat = 2
    }
    
    enum Strings {
        static let albumCellIdentifier: String = "albumCellId"
        static let heartImageName: String = "heart.fill"
    }
}

extension ListCollectionViewCell {
    enum Metric {
        static let cellTitleFontSize: CGFloat = 18
        static let imageContainerInset: CGFloat = 20
        static let cellTitleInset: CGFloat = 10
        static let cellItemsCountInset: CGFloat = 5
        static let borderThickness: CGFloat = 1
        static let borderInset: CGFloat = 32
    }
    
    enum Strings {
        static let listCellIdentifier: String = "listCellId"
        static let arrowImageName: String = "chevron.right"
        static let screenRecordings: String = "Screen Recordings"
        static let recentlyDeleted: String = "Recently Deleted"
    }
}

extension ViewController {
    enum Strings {
        static let navigationTitle = "Albums"
        static let firstSectionHeader = "My Albums"
        static let secondSectionHeader = "Shared Albums"
        static let thirdSectionHeader = "Media Types"
        static let fourthSectionHeader = "Utilities"
    }
}
