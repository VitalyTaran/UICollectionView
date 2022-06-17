//
//  HeaderView.swift
//  UICollectionView
//
//  Created by Виталий Таран on 16.06.2022.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    // MARK: - Header ID
    
    static let headerId = Strings.headerId
    
    // MARK: - Hiding a button for certain sections
    
    var isSeeAllHidden: Bool! {
        didSet {
            self.seeAllButton.isHidden = isSeeAllHidden
        }
    }
    
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
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Metric.labelFontSize, weight: .bold)
        return label
    }()
    
    private lazy var seeAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Strings.seeAllButtonTitle, for: .normal)
        return button
    }()
    
    // MARK: - Settings
    
    private func setupHierarchy() {
        self.addSubview(headerLabel)
        self.addSubview(seeAllButton)
        self.layer.addBorder(edge: .top, color: .systemGray5, thickness: Metric.borderThickness, widthAdjustment: Metric.widthAdjustment, inset: .zero)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([headerLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                                     headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     
                                     seeAllButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                                     seeAllButton.trailingAnchor.constraint(equalTo: self.trailingAnchor)])
    }
    
    func configure(with title: String) {
        headerLabel.text = title
    }
}


