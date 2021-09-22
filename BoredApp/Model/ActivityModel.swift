//
//  ActivityModel.swift
//  BoredApp
//
//  Created by Gleb Tregubov on 22.09.2021.
//

import UIKit

struct Activity: Codable {
    var activity: String
    var accessibility: Double
    var type: String
    var participants: Int
    var price: Double
    var link: String
    var key: String
}
