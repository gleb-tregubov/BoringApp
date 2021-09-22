//
//  CategoriesTypesTableViewCell + Collection View Delegate.swift
//  BoredApp
//
//  Created by Gleb Tregubov on 22.09.2021.
//

import UIKit

extension ParametersViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let insets = UIEdgeInsets(top: 0.0, left: 15.0, bottom: 0.0, right: 15.0)
        return insets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let exampleLabel = CategorieTypeLabel(withText: self.dataSource[indexPath.row], backgroundColor: .black)

        let categorieTypeLabelSize = exampleLabel.intrinsicContentSize
        
        return categorieTypeLabelSize
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
}

extension ParametersViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        
        let cell = collectionView.cellForItem(at: indexPath)!
        
        if cell.isSelected {
            collectionView.deselectItem(at: indexPath, animated: true)
            self.activity = nil
            self.activityColor = nil
            return false
        }
        
        return true
    }
    
//    func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
//        return true
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CategoryTypeCollectionViewCell
        
        
        let cellActivity = cell.label.text
        
        let cellColor = cell.label.backgroundColor
        
        self.activity = cellActivity
        self.activityColor = cellColor// ?? UIColor(rgb: 0x828282)
        
    }
    
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        self.activity = nil
//        self.activityColor = nil
//    }
    
}

extension ParametersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let colors = [0xEB5757, 0xF2994A, 0xF2C94C, 0x219653, 0x2F80ED]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryTypeCollectionViewCell.reuseIdentifier, for: indexPath) as! CategoryTypeCollectionViewCell
        
        let activity: String = self.dataSource[indexPath.row]
        let color: UIColor = UIColor(rgb: colors.randomElement() ?? 0x22EB5757)
        
        cell.configureCell(withActivity: activity, Color: color)
        
        return cell
    }
    
    
}
