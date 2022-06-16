//
//  ListCellAPI.swift
//  UICollectionView
//
//  Created by Виталий Таран on 16.06.2022.
//

class ListCellAPI {
    static func getData() -> [[ListCellModel]] {
        let models = [[ListCellModel(cellImageName: "video",
                           cellTitle: "Videos",
                           cellItemsCount: "218"),
                       ListCellModel(cellImageName: "person.crop.square",
                           cellTitle: "Selfies",
                           cellItemsCount: "168"),
                       ListCellModel(cellImageName: "livephoto",
                           cellTitle: "Live Photos",
                           cellItemsCount: "218"),
                       ListCellModel(cellImageName: "cube",
                           cellTitle: "Portrait",
                           cellItemsCount: "3"),
                       ListCellModel(cellImageName: "square.stack.3d.down.right",
                           cellTitle: "Bursts",
                           cellItemsCount: "3"),
                       ListCellModel(cellImageName: "camera.viewfinder",
                           cellTitle: "Screenshots",
                           cellItemsCount: "218"),
                       ListCellModel(cellImageName: "record.circle",
                           cellTitle: "Screen Recordings",
                           cellItemsCount: "4")],
                      [ListCellModel(cellImageName: "square.and.arrow.down",
                           cellTitle: "Imports",
                           cellItemsCount: "5"),
                       ListCellModel(cellImageName: "eye.slash",
                           cellTitle: "Hidden",
                           cellItemsCount: "0"),
                       ListCellModel(cellImageName: "trash",
                           cellTitle: "Recently Deleted",
                                     cellItemsCount: "5")]]
        return models
    }
}

