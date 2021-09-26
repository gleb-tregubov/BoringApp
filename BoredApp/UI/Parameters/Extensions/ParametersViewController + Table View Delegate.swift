//
//  ParametersViewController + Table View Delegate.swift
//  BoredApp
//
//  Created by Gleb Tregubov on 21.09.2021.
//

import UIKit

extension ParametersViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 285.0
        case 1:
            return 90.0
        case 2:
            return 60.0
        default:
            return 40.0
        }
    }
    
}

extension ParametersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesTypesTableViewCell.reuseIdentifier) as! CategoriesTypesTableViewCell
            
            cell.parametersViewController = self
            
            cell.categoryTypeCollectionView.delegate = self
            cell.categoryTypeCollectionView.dataSource = self
            
            cell.selectionStyle = .none
            
            return cell
        case 1:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ParticipantsTextFieldSettingsTableViewCell.reuseIdentifier) as! ParticipantsTextFieldSettingsTableViewCell
            
            cell.participantsTextField.delegate = self
            cell.participantsTextField.addTarget(self, action: #selector(participantsTextFieldEditingChanged), for: .editingChanged)
            
            cell.selectionStyle = .none
            
            return cell
            
        case 2:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: PriceToggleSettingsTableViewCell.reuseIdentifier) as! PriceToggleSettingsTableViewCell
            
            cell.priceToggleSwitch.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
            cell.selectionStyle = .none
            
            return cell
            
        default:
            
            let cell = UITableViewCell()
            
            cell.selectionStyle = .none
            
            return cell
        }
        
    }
    
}
