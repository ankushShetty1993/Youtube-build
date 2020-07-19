//
//  Model.swift
//  Youtube-build
//
//  Created by Admin on 7/19/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

class Model {
    //Create a URL Object
    
    
    func getVideos(){
        
    let url = URL(string: Constants.API_URL)
    
    guard url != nil else{
       return
    }
    
    // Get a URLSession Object
    let session = URLSession.shared
    
    // Get a data task from URLSession Object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error != nil || data != nil{
                return
            }
        }
        dataTask.resume()
     
        }
    
    
    
    
}
