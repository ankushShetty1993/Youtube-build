//
//  Constants.swift
//  Youtube-build
//
//  Created by Admin on 7/19/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation


struct Constants {
    
    static var API_KEY = "AIzaSyBrVKCrcpEurHGoHYzM3sPNtBEg1F7gl5w"
    static var PLAYLIST_ID = "UU2D6eRvCeMtcF5OGHf1-trw"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}
