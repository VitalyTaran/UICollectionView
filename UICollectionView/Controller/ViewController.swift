//
//  ViewController.swift
//  UICollectionView
//
//  Created by Виталий Таран on 16.06.2022.
//

import UIKit

class ViewController: UICollectionViewController {
    
    // MARK: - Data models
    
    let models = AlbumCellAPI.getData()
    
    // MARK: - Initialization
    
    init() {
        super.init(collectionViewLayout: ViewController.createLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupCollectionView()
    }
    
    // MARK: - Collection view layout
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            switch sectionNumber {
            case 0:
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
                section.contentInsets.bottom = 16
                
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
                ]

                return section
            case 1:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets.trailing = 8
                
                let horizontalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .estimated(175))
                let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: horizontalGroupSize, subitem: item, count: 2)
                
                let section = NSCollectionLayoutSection(group: horizontalGroup)
                section.orthogonalScrollingBehavior = .groupPaging
                section.contentInsets.leading = 16
                section.contentInsets.trailing = 16
                section.contentInsets.bottom = 56
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
                ]

                return section
            default:
                return nil
            }
        }
    }
    
    // MARK: - Settings
    
    private func setupView() {
        let addItem = UIBarButtonItem(systemItem: .add)
        navigationController?.navigationBar.topItem?.setLeftBarButton(addItem, animated: true)
        navigationItem.title = "Albums"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(AlbumCollectionViewCell.self, forCellWithReuseIdentifier: AlbumCollectionViewCell.identifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.headerId)
    }
    
    
    // MARK: - UICollectionViewDelegate, UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models[section].count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCollectionViewCell.identifier, for: indexPath) as! AlbumCollectionViewCell
        cell.configure(with: models[indexPath.section][indexPath.row])
        
        if indexPath.section == 0 && indexPath.row == 2 {
            cell.isHeartHidden = false
        } else {
            cell.isHeartHidden = true
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.headerId, for: indexPath) as! HeaderView

        switch indexPath.section {
        case 0:
            header.configure(with: "My Albums")
            header.isSeeAllHidden = false
        case 1:
            header.configure(with: "Shared Albums")
            header.isSeeAllHidden = true
        default:
            break
        }
        
        return header
    }
}

// MARK: - ViewController preview

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

