//
//  SavedActivitiesViewController + CollectionView Delegate.swift
//  BoredApp
//
//  Created by Gleb Tregubov on 24.09.2021.
//

import UIKit

extension SavedActivitiesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.width - 16.0 * 2
        let height = CGFloat(243.0)
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 30.0, left: 18.0, bottom: 30.0, right: 18.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30.0
    }
    
}

extension SavedActivitiesViewController: UICollectionViewDelegate {
    
}

extension SavedActivitiesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActivityCollectionViewCell.reuseIdentifier, for: indexPath) as! ActivityCollectionViewCell
        
        cell.configureCell(
            withType: dataSource[indexPath.row].type ?? "no type",
            color: UIColor(withRandomColor: ()),
//           color: dataSource[indexPath.row].color,
           activity: dataSource[indexPath.row].activity ?? "",
            participants: Int(dataSource[indexPath.row].paricipantsNumber),
           price: dataSource[indexPath.row].price
        )
        
        return cell
    }
    
    
}
