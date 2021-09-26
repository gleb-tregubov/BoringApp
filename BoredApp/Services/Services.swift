//
//  Services.swift
//  BoredApp
//
//  Created by Gleb Tregubov on 22.09.2021.
//

import UIKit

protocol ServicesProtocol {
    func loadActivity(withParams params: UserActivityChoiceModel?, withCompletion completion: @escaping (_ activity: ActivityModel?, _ error: Error?) -> Void)
}

struct Services: ServicesProtocol {
    
    let session = URLSession.shared
    
    let parser = JSONParser()
    
    func loadActivity(withParams params: UserActivityChoiceModel? = nil, withCompletion completion: @escaping (_ activity: ActivityModel?, _ error: Error?) -> Void) {
        
        var components = URLComponents()
        var queryItems = [URLQueryItem]()
        var url: URL?
        components.scheme = "https"
        components.host = "www.boredapi.com"
        components.path = "/api/activity/"
        
        if let userActivityChoice = params {
            
            if userActivityChoice.price {
                queryItems.append(URLQueryItem(name: "minprice", value: "0.1"))
                queryItems.append(URLQueryItem(name: "maxprice", value: "1"))
            } else {
                queryItems.append(URLQueryItem(name: "price", value: "0.0"))
            }
            
            if let activityType = userActivityChoice.type {
                queryItems.append(URLQueryItem(name: "type", value: activityType))
            }
            
            if let activityParticipants = userActivityChoice.participants {
                queryItems.append(URLQueryItem(name: "participants", value: "\(activityParticipants)"))
            }
            components.queryItems = queryItems
//            url = components.url
            
        } else {
//            url = URL(string: "https://www.boredapi.com/api/activity/")
        }
        
        components.queryItems = queryItems
        url = components.url
        
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            if let e = error {
                completion(nil, error)
                print(e)
                return
            }
            
            if let data = data {
                parser.parseActivity(data: data, completion: completion)
//                print(data)
            }
            
        }
        
        dataTask.resume()
    }
    
}
