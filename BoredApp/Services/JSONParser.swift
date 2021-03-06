//
//  JSONParser.swift
//  BoredApp
//
//  Created by Gleb Tregubov on 22.09.2021.
//

import UIKit

struct JSONParser {
    
    func parseActivity(data: Data, completion: (_ activity: Activity?, _ error: Error?) -> Void) {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let activity = try decoder.decode(Activity.self, from: data)
            print("!!! RECIEVING ACTIVITY: \(activity.activity)")
            completion(activity, nil)
        } catch {
            completion(nil, error)
            print(error)
        }
    }
    
}
