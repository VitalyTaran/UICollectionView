//
//  ViewController.swift
//  UICollectionView
//
//  Created by Виталий Таран on 16.06.2022.
//

import UIKit

class ViewController: UICollectionViewController {
    
    private let cellId = "cllDd"
    let models = AlbumCellAPI.getData()
    
    static let categoryHeaderId = "categoryHeaderId"
    static let headerId = "headerId"
    
    init() {
        super.init(collectionViewLayout: ViewController.createLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        navigationItem.title = "Albums"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(AlbumCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: ViewController.categoryHeaderId, withReuseIdentifier: ViewController.headerId)
    }
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in

            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets.trailing = 8
            
            let horizontalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.6))
            let containerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .estimated(350))
            
            let horizontalGroupOne = NSCollectionLayoutGroup.horizontal(layoutSize: horizontalGroupSize, subitem: item, count: 2)
            let horizontalGroupTwo = NSCollectionLayoutGroup.horizontal(layoutSize: horizontalGroupSize, subitem: item, count: 2)
            let containerGroup = NSCollectionLayoutGroup.vertical(layoutSize: containerGroupSize, subitems: [horizontalGroupOne, horizontalGroupTwo])
            
            containerGroup.interItemSpacing = .fixed(8)
            
            
            let section = NSCollectionLayoutSection(group: containerGroup)
            section.orthogonalScrollingBehavior = .groupPaging
            section.contentInsets.leading = 16
            section.contentInsets.trailing = 16
            

            section.boundarySupplementaryItems = [
                .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40)), elementKind: categoryHeaderId, alignment: .topLeading)
            ]

            return section
        }
    }
    
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models[section].count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AlbumCollectionViewCell
        cell.configure(with: models[indexPath.section][indexPath.row])
        if indexPath.row == 4 {
            cell.isHeartHidden = false
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ViewController.headerId, for: indexPath)
        return header
    }

}

import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Container {
            ViewController()
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    struct Container: UIViewControllerRepresentable{
        
        let vc: ViewController
        
        init(_ builder: @escaping () -> ViewController) {
            vc = builder()
        }
        
        func makeUIViewController(context: Context) -> UIViewController {
            UINavigationController(rootViewController: vc)
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            
        }
    }
}

