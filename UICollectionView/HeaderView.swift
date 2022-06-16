//
//  HeaderView.swift
//  UICollectionView
//
//  Created by Виталий Таран on 16.06.2022.
//

import Foundation

import UIKit

class HeaderView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHirarchy()
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private lazy var containerStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
//        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "My Albums"
        return label
    }()
    
    private lazy var seeAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("See All", for: .normal)
        return button
    }()
    
    
    private func setupHirarchy() {
//        self.addSubview(containerStack)
        self.addSubview(headerLabel)
        self.addSubview(seeAllButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([headerLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                                     headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     seeAllButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                                     seeAllButton.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    

    
    
}

import SwiftUI

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Container {
            HeaderView()
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    struct Container: UIViewRepresentable{
        typealias UIViewType = HeaderView
        
        
        let view: HeaderView
        
        init(_ builder: @escaping () -> HeaderView) {
            view = builder()
        }
        func makeUIView(context: Context) -> HeaderView {
            view
        }
        
        func updateUIView(_ uiView: HeaderView, context: Context) {
            
        }

    }
}

