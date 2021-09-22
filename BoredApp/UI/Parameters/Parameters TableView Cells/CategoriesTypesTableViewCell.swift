//
//  CategoriesTypesTableViewCell.swift
//  BoredApp
//
//  Created by Gleb Tregubov on 22.09.2021.
//

import UIKit

class CategoriesTypesTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "CategorieTypeCellId"
    
    var parametersViewController: ParametersViewController?
    
    let titleLable: UILabel = {
        let view = UILabel()
        
        view.text = "TYPE"
        view.font = UIFont(name: "Nunito-ExtraBold", size: 16.0)
        view.textColor = UIColor(rgb: 0x3C3C43)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var categoryTypeCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.isScrollEnabled = false
//        view.allowsMultipleSelection = true
        
        view.register(CategoryTypeCollectionViewCell.self, forCellWithReuseIdentifier: CategoryTypeCollectionViewCell.reuseIdentifier)
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupAppearance()
    }
    
    private func setupAppearance() {
        
        setupTitleLabel()
        setupCategoryTypeCollectionViewCell()
    }
    
    private func setupTitleLabel() {
        contentView.addSubview(titleLable)
        
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12.0)
        ])
    }
    
    private func setupCategoryTypeCollectionViewCell() {
        contentView.addSubview(categoryTypeCollectionView)
        
//        categoryTypeCollectionView.delegate = self.parametersViewController
//        categoryTypeCollectionView.dataSource = self.parametersViewController
        
        NSLayoutConstraint.activate([
            categoryTypeCollectionView.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 18.0),
            categoryTypeCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12.0),
            categoryTypeCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12.0),
            categoryTypeCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

}
