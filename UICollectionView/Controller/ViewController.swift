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
    let listModels = ListCellAPI.getData()
    
    // MARK: - Initialization
    
    init() {
        super.init(collectionViewLayout: CollectionViewLayout.createLayout())
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
    
    // MARK: - Settings
    
    private func setupView() {
        let addItem = UIBarButtonItem(systemItem: .add)
        navigationController?.navigationBar.topItem?.setLeftBarButton(addItem, animated: true)
        navigationItem.title = Strings.navigationTitle
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(AlbumCollectionViewCell.self, forCellWithReuseIdentifier: AlbumCollectionViewCell.identifier)
        collectionView.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: ListCollectionViewCell.identifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.headerId)
    }
    
    
    // MARK: - UICollectionViewDelegate, UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return models.count + listModels.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0, 1:
            return models[section].count
        case 2, 3:
            return listModels[section - 2].count
        default:
            return 0
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0, 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCollectionViewCell.identifier, for: indexPath) as! AlbumCollectionViewCell
            cell.configure(with: models[indexPath.section][indexPath.row])
            if indexPath.section == 0 && indexPath.row == 2 {
                cell.isHeartHidden = false
            } else {
                cell.isHeartHidden = true
            }
            return cell
        case 2, 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.identifier, for: indexPath) as! ListCollectionViewCell
            cell.configure(with: listModels[indexPath.section - 2][indexPath.row])
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.headerId, for: indexPath) as! HeaderView

        switch indexPath.section {
        case 0:
            header.configure(with: Strings.firstSectionHeader)
            header.isSeeAllHidden = false
        case 1:
            header.configure(with: Strings.secondSectionHeader)
            if models[indexPath.section].count > 2 {
                header.isSeeAllHidden = false
            } else {
                header.isSeeAllHidden = true
            }
        case 2:
            header.configure(with: Strings.thirdSectionHeader)
            header.isSeeAllHidden = true
        case 3:
            header.configure(with: Strings.fourthSectionHeader)
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



