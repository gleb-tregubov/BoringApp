//
//  CarView.swift
//  BoredApp
//
//  Created by Gleb Tregubov on 21.09.2021.
//

import UIKit

class CardView: UIView {
    
    let participantsNumber = 1
    
    let priceValue = 0
    
//    let colors = [0xEB5757, 0xF2994A, 0xF2C94C, 0x219653, 0x2F80ED]
    
    let categorieTypeLabel = CategorieTypeLabel(withText: "          ", backgroundColor: UIColor.white)
    
    let activityLabel: UILabel = {
        let view = UILabel()
        
        view.numberOfLines = 0
        view.textAlignment = .left
        view.font = UIFont(name: "Nunito-Bold", size: 50.0)
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.text = "Do something you used to do as a kid"
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
        addSubview(activityLabel)
        
        NSLayoutConstraint.activate([
            activityLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 23.0),
            activityLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -23.0),
            activityLabel.topAnchor.constraint(equalTo: categorieTypeLabel.bottomAnchor, constant: 10.0),
            activityLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -70.0)
        ])
    }
    
    private func setupCategorieTypeLabel() {
        addSubview(categorieTypeLabel)
        
        NSLayoutConstraint.activate([
            categorieTypeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            categorieTypeLabel.topAnchor.constraint(equalTo: self.topAnchor),
            categorieTypeLabel.heightAnchor.constraint(equalToConstant: 40.0)
        ])
    }
    
    private func setupParticipantsStackView() {
        addSubview(participantsStackView)
        
        participantsStackView.addArrangedSubview(participantsNumberLabel)
        participantsNumberLabel.text = "\(participantsNumber)"
        
        NSLayoutConstraint.activate([
            participantsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 23.0),
            participantsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -23.0)
        ])
    }
    
    private func setupPriceStackView() {
        addSubview(priceStackView)
        
        priceStackView.addArrangedSubview(priceValueLabel)
//        priceValueLabel.text = priceValue == 0 ? "free" : "\(priceValue)"
        
        NSLayoutConstraint.activate([
            priceStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -23),
            priceStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -23)
        ])
    }
    
}
