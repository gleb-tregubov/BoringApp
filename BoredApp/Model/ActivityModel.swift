//
//  ActivityModel.swift
//  BoredApp
//
//  Created by Gleb Tregubov on 22.09.2021.
//

import UIKit

protocol ActivityModelProtocol {
    var activity: String { get }
    var accessibility: Double { get }
    var type: String { get }
    var participants: Int { get }
    var price: Double { get }
    var link: String { get }
    var key: String { get }
}

struct ActivityModel: ActivityModelProtocol, Codable {
    let activity: String
    let accessibility: Double
    let type: String
    let participants: Int
    let price: Double
    let link: String
    let key: String
}
