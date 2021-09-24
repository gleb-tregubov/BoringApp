//
//  ActivityCollectionViewCell.swift
//  BoredApp
//
//  Created by Gleb Tregubov on 24.09.2021.
//

import UIKit

class ActivityCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "ActivityCellId"
    
    let categorieTypeLabel = CategorieTypeLabel(withText: "     test     ", backgroundColor: UIColor.white)
    
    let activityLabel: UILabel = {
        let view = UILabel()
        
        view.numberOfLines = 0
        view.textAlignment = .left
        view.font = UIFont(name: "Nunito-Bold", size: 25.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.sizeToFit()
        
        return view
    }()
    
    let participantsStackView: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .horizontal
        stack.spacing = 5.0
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        let config = UIImage.SymbolConfiguration(pointSize: 18, weight: .black, scale: .large)
        let participantsIcon = UIImageView(image: UIImage(systemName: "person", withConfiguration: config))
        participantsIcon.tintColor = .black
        
        stack.addArrangedSubview(participantsIcon)
        
        return stack
    }()
    
    let participantsNumberLabel: UILabel = {
        let view = UILabel()
        
        view.font = UIFont(name: "Nunito-ExtraBold", size: 25.0)
        view.textColor = UIColor(rgb: 0x979797)
        
        return view
    }()
    
    let priceStackView: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .horizontal
        stack.spacing = 5.0
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        let config = UIImage.SymbolConfiguration(pointSize: 18, weight: .black, scale: .large)
        let priceIcon = UIImageView(image: UIImage(systemName: "dollarsign.circle.fill", withConfiguration: config))
        priceIcon.tintColor = .black
        
        stack.addArrangedSubview(priceIcon)
        
        return stack
    }()
    
    let priceValueLabel: UILabel = {
        let view = UILabel()
        
        view.font = UIFont(name: "Nunito-ExtraBold", size: 25.0)
        view.textColor = UIColor(rgb: 0x979797)
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(withType type: String, color: UIColor, activity: String, participants: Int, price: Double) {
        self.categorieTypeLabel.text = type
        self.categorieTypeLabel.backgroundColor = color
        self.activityLabel.text = activity
        self.participantsNumberLabel.text = "\(participants)"
        self.priceValueLabel.text = price != 0.0 ? "\(price)" : "free"
    }
    
    private func setupAppearance() {
        layer.cornerRadius = 16.0
        
        layer.shadowOffset = .zero
        layer.shadowRadius = 8.0
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .white

        setupCategorieTypeLabel()
        setupActivityLabel()
        setupParticipantsStackView()
        setupPriceStackView()
    }
    
    private func setupActivityLabel() {
        contentView.addSubview(activityLabel)
        
        NSLayoutConstraint.activate([
            activityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 23.0),
            activityLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -23.0),
            activityLabel.topAnchor.constraint(equalTo: categorieTypeLabel.bottomAnchor, constant: 10.0),
            activityLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -70.0)
        ])
    }
    
    private func setupCategorieTypeLabel() {
        contentView.addSubview(categorieTypeLabel)
        
        NSLayoutConstraint.activate([
            categorieTypeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categorieTypeLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            categorieTypeLabel.heightAnchor.constraint(equalToConstant: 40.0)
        ])
    }
    
    private func setupParticipantsStackView() {
        contentView.addSubview(participantsStackView)
        
        participantsStackView.addArrangedSubview(participantsNumberLabel)
        participantsNumberLabel.text = "2" //"\(participantsNumber)"
        
        NSLayoutConstraint.activate([
            participantsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 23.0),
            participantsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -23.0)
        ])
    }
    
    private func setupPriceStackView() {
        contentView.addSubview(priceStackView)
        
        priceStackView.addArrangedSubview(priceValueLabel)
        priceValueLabel.text = "free"
        
        NSLayoutConstraint.activate([
            priceStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -23),
            priceStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -23)
        ])
    }
    
}
