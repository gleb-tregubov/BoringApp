//
//  BoredAppViewController + Services interface.swift
//  BoredApp
//
//  Created by Gleb Tregubov on 24.09.2021.
//

import UIKit
import SPAlert

extension BoredAppViewController {
    
    func startLoading(params: UserActivityChoiceModel? = nil) {
        
        self.services.loadActivity(withParams: params) { [weak self] activity, error in
            DispatchQueue.main.async {
                
                if let _ = error {
                    
                    SPAlert.present(title: "not found", message: "😔 pls change condition", preset: .custom(UIImage(systemName: "xmark") ?? .checkmark), haptic: .error, completion: nil)
                    
                    return
                }
                
                if let data = activity {
                    
                    self?.currentActivity = SavedActivityModel(activity: data.activity,
                                                               type: data.type,
                                                               participants: data.participants,
                                                               price: data.price,
                                                               color: self?.parametersVC.activityColor ?? UIColor(withRandomColor: ()))
                    
                    self?.cardView.activityLabel.text = data.activity
                    self?.cardView.categorieTypeLabel.text = data.type
                    self?.cardView.participantsNumberLabel.text = "\(data.participants)"
                    self?.cardView.priceValueLabel.text = data.price == 0.0 ? "free" : "\(data.price)"
                    self?.cardView.categorieTypeLabel.backgroundColor = self?.parametersVC.activityColor ?? UIColor(withRandomColor: ())
                }
            }
        }
        
    }
}
