//
//  DetailViewController.swift
//  Youtube-build
//
//  Created by Admin on 7/19/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import WebKit
class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var webviewLabel: WKWebView!
    
    @IBOutlet weak var textViewLabel: UITextView!
    
    var video:Video?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.titleLabel.text = ""
        self.dateLabel.text = ""
        self.textViewLabel.text = ""
        
        guard self.video != nil else {
            return
        }
        
        let embedUrlString = Constants.YT_EMBED_URL + self.video!.videoId
        
        let url = URL(string: embedUrlString)
        let urlReq = URLRequest(url: url!)
        self.webviewLabel.load(urlReq)
        
        self.titleLabel.text = self.video!.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE,MMM d,yyyy"
        self.dateLabel.text = df.string(from: self.video!.published)
        self.textViewLabel.text = self.video!.description

 

    }
    

   

}
