//
//  ViewController.swift
//  Youtube-build
//
//  Created by Admin on 7/19/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,ModelDelegate {

    @IBOutlet weak var tableView: UITableView!
    var model = Model()

    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        model.delegate = self
        model.getVideos()
    }
    
    func videosFetched(_ videos: [Video]) {
        
        self.videos = videos
        
        //This reloads the data
        tableView.reloadData()
        
    }
    
    // MARK : - TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEO_CELL_ID, for: indexPath)
        
        let title = self.videos[indexPath.row].title
        cell.textLabel?.text = title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }


}

