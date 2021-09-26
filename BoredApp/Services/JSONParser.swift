//
//  JSONParser.swift
//  BoredApp
//
//  Created by Gleb Tregubov on 22.09.2021.
//

import UIKit

protocol ParserProtocol {
    func parseActivity(data: Data, completion: (_ activity: ActivityModel?, _ error: Error?) -> Void)
}

struct JSONParser: ParserProtocol {
    
    func parseActivity(data: Data, completion: (_ activity: ActivityModel?, _ error: Error?) -> Void) {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let activity = try decoder.decode(ActivityModel.self, from: data)
            print("!!! RECIEVING ACTIVITY: \(activity.activity)")
            completion(activity, nil)
        } catch {
            completion(nil, error)
            print(error)
        }
    }
    
}
