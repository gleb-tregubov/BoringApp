//
//  CategoryTypeCollectionViewCell.swift
//  BoredApp
//
//  Created by Gleb Tregubov on 22.09.2021.
//

import UIKit

class CategoryTypeCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "CategorieTypeCollectionViewCellId"
    
    let label = CategorieTypeLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAppearance() {
        setupLabel()
    }
    
    private func setupLabel() {
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configureCell(withActivity activity: String, Color color: UIColor) {
        self.label.text = activity
        self.label.backgroundColor = color
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                label.layer.borderWidth = 5.0
                label.layer.borderColor = UIColor.black.cgColor
            } else {
                label.layer.borderWidth = 0.0
                label.layer.borderColor = nil
            }
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                label.layer.borderWidth = 5.0
                label.layer.borderColor = UIColor.lightGray.cgColor
            } else {
                label.layer.borderWidth = 0.0
                label.layer.borderColor = nil
            }
        }
    }
    
}
