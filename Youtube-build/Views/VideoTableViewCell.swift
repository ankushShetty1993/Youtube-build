//
//  VideoTableViewCell.swift
//  Youtube-build
//
//  Created by Admin on 7/19/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var thumbNailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video){
        self.video = v
        
        guard self.video != nil else{
            return
        }
        self.titleLabel.text = self.video?.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE,MMM d,yyyy"
        self.dateLabel.text = df.string(from: self.video!.published)
        
        guard self.video!.thumbnail != "" else {
            return
        }
        
        if let cachedData =  CacheManager.getVideoCache(self.video!.thumbnail){
             
            self.thumbNailImageView.image = UIImage(data: cachedData)
            return
        }
        
        let url = URL(string: self.video!.thumbnail)
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil{
                
                //Save data in cache
                
                CacheManager.setVideoCache(url!.absoluteString, data)
                //Check downloaded url matches the video that this cell is clicked
                
                if url?.absoluteString != self.video?.thumbnail {
                    //Video cell has been recycled for another video and no longer matches with the thumbnail
                    return
                }
                
                let image = UIImage(data: data!)
                
                DispatchQueue.main.async {
                 self.thumbNailImageView.image = image

                }
                
                
            }
        }
        dataTask.resume()
    }

}
