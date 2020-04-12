//
//  ViewController.swift
//  youtube-clone
//
//  Created by pop on 3/22/20.
//  Copyright © 2020 pop. All rights reserved.
//

import UIKit
import youtube_ios_player_helper
import Pods_youtube_clone
import Alamofire
import SwiftyJSON

class videoPlay: UIViewController {
    var videoID:String?
    @IBOutlet weak var Testimage: UIImageView!
    
    let url = "https://www.googleapis.com/youtube/v3/channels"
    let url2 = "https://www.googleapis.com/youtube/v3/subscriptions"
    let videoChannel = "https://www.googleapis.com/youtube/v3/videos"
    let api = "AIzaSyB43vfEpUD3NFH5ZV3l1UXcJOZ5aZ7SIZQ"
    
    @IBOutlet weak var YTBviewplayer:YTPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.YTBviewplayer.load(withVideoId: videoID!)
      
    }

 
    @IBAction func stopBTN(_ sender: UIButton) {
        print("stop pressed")
        self.YTBviewplayer.stopVideo()
    }
    
    @IBAction func playBTN(_ sender: UIButton) {
        print("play pressed")
        self.YTBviewplayer.playVideo()
    }

    
//
//    func getimage( test:String){
//
//            let url = URL(string: test)
//            DispatchQueue.global().async {
//                let data = try? Data(contentsOf: url!)
//                DispatchQueue.main.async {
//                    self.Testimage.image = UIImage(data: data!)
//             }
//           }
//        }
//
//}


}



