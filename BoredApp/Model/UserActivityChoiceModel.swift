//
//  UserActivityChoiceModel.swift
//  BoredApp
//
//  Created by Gleb Tregubov on 22.09.2021.
//

import UIKit

protocol UserActivityChoiceModelProtocol {
    var type: String? { get }
    var participants: Int? { get }
    var price: Bool { get }
}

struct UserActivityChoiceModel: UserActivityChoiceModelProtocol {
    let type: String?
    let participants: Int?
    let price: Bool
}
