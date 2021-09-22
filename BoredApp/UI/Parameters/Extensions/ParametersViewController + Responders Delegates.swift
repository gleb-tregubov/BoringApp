//
//  ParametersViewController + Text Field Delegate.swift
//  BoredApp
//
//  Created by Gleb Tregubov on 22.09.2021.
//

import UIKit

extension ParametersViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        participants = Int(textField.text ?? "0") ?? 0
        print(participants)
        return textField.resignFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(hide))
        view.addGestureRecognizer(gesture)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let gesture = view.gestureRecognizers?.first else { return }
        
        view.removeGestureRecognizer(gesture)
    }
    
    @objc private func hide() {
        let cell = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as! ParticipantsTextFieldSettingsTableViewCell
        
        participants = Int(cell.participantsTextField.text ?? "0") ?? 0
        print(participants)
        view.endEditing(true)
    }
}

extension ParametersViewController {
    
    @objc func switchValueChanged(_ toggle: UISwitch) {
        price = toggle.isOn ? 1 : 0
        print(price)
    }
    
}


