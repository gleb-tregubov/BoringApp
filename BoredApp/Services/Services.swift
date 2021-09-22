//
//  Services.swift
//  BoredApp
//
//  Created by Gleb Tregubov on 22.09.2021.
//

import UIKit

struct Services {
    
    let session = URLSession.shared
    
    let parser
    
    func loadActivity(withCompletion completion: (_ activity: Activity) -> Void) {
        let url = URL(string: "http://www.boredapi.com/api/activity/")
        
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            if let e = error {
                print(e)
                return
            }
            
            print(data)
            
        }
        
        dataTask.resume()
    }
    
}
