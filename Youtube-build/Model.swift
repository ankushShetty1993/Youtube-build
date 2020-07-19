//
//  Model.swift
//  Youtube-build
//
//  Created by Admin on 7/19/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
protocol ModelDelegate {
    func videosFetched(_ videos:[Video])
}

class Model {
    //Create a URL Object
    var delegate:ModelDelegate?
    
    func getVideos(){
        
    let url = URL(string: Constants.API_URL)
    
    guard url != nil else{
       return
    }
    
    // Get a URLSession Object
    let session = URLSession.shared
    
    // Get a data task from URLSession Object
        let dataTask = session.dataTask(with: url!) { (data, response, error)
            in
            // check if there are any errors
            if error != nil || data == nil{
                return
            }
            // Parsing the data into Video Objects
            
            do{
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                
                if response.items != nil{
                    DispatchQueue.main.async {
                        self.delegate?.videosFetched(response.items!)

                    }
                }
                dump(response)

                
                
                
            }catch{
                
            }
            
        }
        dataTask.resume()
     
        }
    
    
    
    
}
