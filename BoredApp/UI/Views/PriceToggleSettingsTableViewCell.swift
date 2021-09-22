//
//  PriceToggleTableViewCell.swift
//  BoredApp
//
//  Created by Gleb Tregubov on 21.09.2021.
//

import UIKit

class PriceToggleSettingsTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "PriceToggleCellId"
    
    let priceToggleSwitch: UISwitch = {
        let view = UISwitch()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let titleLabel: UILabel = {
        let view = UILabel()
        
        view.text = "PRICE"
        view.font = UIFont(name: "Nunito-ExtraBold", size: 16.0)
        view.textColor = UIColor(rgb: 0x3C3C43)
        view.translatesAutoresizingMaskIntoConstraints = false
        
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
        setupPriceToggleSwitch()
        setupTitleLabel()
    }
    
    private func setupPriceToggleSwitch() {
        contentView.addSubview(priceToggleSwitch)
        
        NSLayoutConstraint.activate([
            priceToggleSwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20.0),
            priceToggleSwitch.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    private func setupTitleLabel() {
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20.0),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

}
