//
//  categorieTypeLabel.swift
//  BoredApp
//
//  Created by Gleb Tregubov on 21.09.2021.
//

import UIKit

class CategorieTypeLabel: UILabel {
    
    let topInset: CGFloat = 8.0
    let bottomInset: CGFloat = 8.0
    let rightInset: CGFloat = 27.0
    let leftInset: CGFloat = 27.0
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    convenience init(withText text: String, backgroundColor color: UIColor) {
        self.init(frame: .zero)
        
        self.text = text
        self.backgroundColor = color
        
        setupAppearance() 
    }
    
    private func setupAppearance() {
        font = UIFont(name: "Nunito-ExtraBold", size: 17.0)
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .white
        
        layer.cornerRadius = 16.0
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        
        
        clipsToBounds = true
        
        numberOfLines = 1
        
        sizeToFit()
    }
    
    func configure(withText text: String, backgroundColor color: UIColor) {
        self.text = text
        self.backgroundColor = color
    }

}
