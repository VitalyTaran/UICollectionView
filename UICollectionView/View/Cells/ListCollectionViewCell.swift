//
//  ListCollectionViewCell.swift
//  UICollectionView
//
//  Created by Виталий Таран on 16.06.2022.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Identifier
    
    static let identifier = Strings.listCellIdentifier
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - UI Elements
    
    private lazy var imageContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cellImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var cellTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Metric.cellTitleFontSize)
        label.textColor = .systemBlue
        return label
    }()
    
    private lazy var cellItemsCount: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray2
        return label
    }()
    
    private lazy var cellArrowImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: Strings.arrowImageName)
        imageView.tintColor = .systemGray2
        return imageView
    }()
    
    // MARK: - Settings
    
    private func setupHierarchy() {
        self.addSubview(imageContainer)
        imageContainer.addSubview(cellImage)
        self.addSubview(cellTitle)
        self.addSubview(cellItemsCount)
        self.addSubview(cellArrowImage)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([imageContainer.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                                     imageContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     imageContainer.heightAnchor.constraint(equalTo: self.heightAnchor),
                                     imageContainer.widthAnchor.constraint(equalTo: self.heightAnchor, constant: -Metric.imageContainerInset),
                                     
                                     cellImage.centerXAnchor.constraint(equalTo: imageContainer.centerXAnchor),
                                     cellImage.centerYAnchor.constraint(equalTo: imageContainer.centerYAnchor),
                                     
                                     cellTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                                     cellTitle.leadingAnchor.constraint(equalTo: imageContainer.trailingAnchor, constant: Metric.cellTitleInset),
                                     
                                     cellArrowImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                                     cellArrowImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     
                                     cellItemsCount.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                                     cellItemsCount.trailingAnchor.constraint(equalTo: cellArrowImage.leadingAnchor, constant: -Metric.cellItemsCountInset)
        ])
    }
    
    func configure(with model: ListCellModel) {
        cellImage.image = UIImage(systemName: model.cellImageName)
        cellTitle.text = model.cellTitle
        cellItemsCount.text = model.cellItemsCount
        if model.cellTitle != Strings.screenRecordings && model.cellTitle != Strings.recentlyDeleted {
            self.layer.addBorder(edge: .bottom, color: .systemGray3, thickness: Metric.borderThickness, widthAdjustment: .zero, inset: Metric.borderInset)
        }
    }
}



