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
            return 90.0
        case 1:
            return 60.0
        default:
            return 40.0
        }
    }
}

extension ParametersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.row {
        case 0:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ParticipantsTextFieldSettingsTableViewCell.reuseIdentifier) as! ParticipantsTextFieldSettingsTableViewCell
            
            return cell
            
        case 1:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: PriceToggleSettingsTableViewCell.reuseIdentifier) as! PriceToggleSettingsTableViewCell
            
            return cell
            
        default: 
            return UITableViewCell()
        }
        
    }
    
}
