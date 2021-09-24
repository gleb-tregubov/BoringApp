//
//  SaveActivityModel.swift
//  BoredApp
//
//  Created by Gleb Tregubov on 24.09.2021.
//

import UIKit

protocol SavedActivityModelProtocol: Equatable {
    var activity: String { get }
    var type: String { get }
    var participants: Int { get }
    var price: Double { get }
    var color: UIColor { get }
}

struct SavedActivityModel: SavedActivityModelProtocol {
    let activity: String
    let type: String
    let participants: Int
    let price: Double
    let color: UIColor
    
    static func ==(lhs: SavedActivityModel, rhs: SavedActivityModel) -> Bool {
        return (
            lhs.activity == rhs.activity && lhs.type == rhs.type && lhs.participants == rhs.participants && lhs.price == rhs.price
        )
    }
}
