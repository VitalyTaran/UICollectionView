//
//  AlbumCollectionViewCell.swift
//  UICollectionView
//
//  Created by Виталий Таран on 16.06.2022.
//

import UIKit

class AlbumCollectionViewCell: UICollectionViewCell {
    
    
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var isHeartHidden: Bool! {
        didSet {
            heartImg.isHidden = isHeartHidden
        }
    }
    
    // MARK: - UI Elements
    
    private lazy var cellImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    private lazy var cellTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cellPhotosCount: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray2
        return label
    }()
    
    private lazy var heartImg: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "heart.fill")
        imageView.tintColor = .white
        imageView.isHidden = true
        return imageView
    }()
    
    // MARK: - Settings
    
    private func setupHierarchy() {
        contentView.addSubview(cellImage)
        contentView.addSubview(cellTitle)
        contentView.addSubview(cellPhotosCount)
        contentView.addSubview(heartImg)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([cellImage.topAnchor.constraint(equalTo: contentView.topAnchor),
                                    cellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                    cellImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                                    cellImage.heightAnchor.constraint(equalTo: contentView.widthAnchor),
                                    
                                    cellTitle.topAnchor.constraint(equalTo: cellImage.bottomAnchor, constant: 2),
                                     cellTitle.leadingAnchor.constraint(equalTo: cellImage.leadingAnchor),
                                    
                                     cellPhotosCount.topAnchor.constraint(equalTo: cellTitle.bottomAnchor, constant: 2),
                                     cellPhotosCount.leadingAnchor.constraint(equalTo: cellTitle.leadingAnchor),
                                     
                                     heartImg.leadingAnchor.constraint(equalTo: cellImage.leadingAnchor, constant: 2),
                                     heartImg.bottomAnchor.constraint(equalTo: cellImage.bottomAnchor, constant: -2)
                                    ]
                                    
        )
    }
    
    func configure(with model: AlbumCellModel) {
        cellImage.image = UIImage(named: model.imageName)
        cellTitle.text = model.albumName
        cellPhotosCount.text = model.numberOfPhotos
    }
}

