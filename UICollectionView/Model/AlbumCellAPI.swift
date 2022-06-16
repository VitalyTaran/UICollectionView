//
//  AlbumCellAPI.swift
//  UICollectionView
//
//  Created by Виталий Таран on 16.06.2022.
//

import Foundation

class AlbumCellAPI {
    static func getData() -> [[AlbumCellModel]] {
        return [
            [AlbumCellModel(imageName: "recents",
                      albumName: "Recents",
                      numberOfPhotos: "1846"),
             AlbumCellModel(imageName: "memes",
                       albumName: "Memes",
                       numberOfPhotos: "48"),
             AlbumCellModel(imageName: "whatsapp",
                       albumName: "WhatsApp",
                       numberOfPhotos: "229"),
             AlbumCellModel(imageName: "kplus",
                      albumName: "K-Plus",
                      numberOfPhotos: "6"),
             AlbumCellModel(imageName: "favourites",
                      albumName: "Favourites",
                      numberOfPhotos: "21"),
             AlbumCellModel(imageName: "instagram",
                      albumName: "Instagram",
                      numberOfPhotos: "22"),
             AlbumCellModel(imageName: "scb",
                      albumName: "SCB",
                      numberOfPhotos: "127"),
             AlbumCellModel(imageName: "uni",
                      albumName: "Uni",
                      numberOfPhotos: "38")]]
    }
}
