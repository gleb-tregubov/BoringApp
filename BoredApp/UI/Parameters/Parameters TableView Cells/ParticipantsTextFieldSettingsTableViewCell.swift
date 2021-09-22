//
//  ParticipantsTextFieldSettingsTableViewCell.swift
//  BoredApp
//
//  Created by Gleb Tregubov on 21.09.2021.
//

import UIKit

class ParticipantsTextFieldSettingsTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ParticipantsTextFieldCellId"
    
    let stackView: UIStackView = {
        let view = UIStackView()
        
        view.axis = .vertical
        view.alignment = .leading
        view.spacing = 15.0
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let titleLabel: UILabel = {
        let view = UILabel()
        
        view.text = "PARTICIPANTS"
        view.font = UIFont(name: "Nunito-ExtraBold", size: 16.0)
        view.textColor = UIColor(rgb: 0x3C3C43)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let participantsTextField: UITextField = {
        let view = UITextField()
        
        view.attributedPlaceholder = NSAttributedString(string: "Type the number of participants in your activity", attributes: [NSAttributedString.Key.foregroundColor : UIColor(rgb: 0xc6c6c8)])
        view.textColor = UIColor(rgb: 0x3C3C43)
        view.font = UIFont(name: "Nunito-ExtraBold", size: 17.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.keyboardType = .numberPad
        
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
        setupStackView()
    }
    
    private func setupStackView() {
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(participantsTextField)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12.0),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12.0),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

}
