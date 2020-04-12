//
//  helper.swift
//  youtube-clone
//
//  Created by pop on 3/23/20.
//  Copyright © 2020 pop. All rights reserved.
//

import Foundation
import UIKit
import youtube_ios_player_helper
import Pods_youtube_clone
import Alamofire
import SwiftyJSON

class helper{
    static let url = "https://www.googleapis.com/youtube/v3/channels"
    static let api = "AIzaSyB43vfEpUD3NFH5ZV3l1UXcJOZ5aZ7SIZQ"
    static var channelVMarr = [ChannelVM]()
    static var channelarr = [Channel]()
    static var listofvideos = [ItemOfList]()
    static let idChannel:[String] = ["UC2D6eRvCeMtcF5OGHf1-trw","UCuP2vJ6kRutQBfRmdcI92mA","UCbTw29mcP12YlTt1EpUaVJw","UChH6WbyYeX0INJjrK2-6WSg","UCwYjZ3vXQYhJaRwUm6u9-bA"]
     static let idChannel2:[String] = ["UCuP2vJ6kRutQBfRmdcI92mA","UCUZvZvU7-XWgBxrzRn1i1Sw"]
    
    class func loadChannel(completion:@escaping (Bool)->Void){
        var issuccess = true
        for item in idChannel2{
            let parameter = ["part":"snippet","id":item,"key":api] as [String : Any]
            Alamofire.request(url, method: .get, parameters: parameter, encoding: URLEncoding.default, headers: nil) .responseJSON { (response) in
                if response.result.isSuccess{
                    let jsonData:JSON = JSON(response.result.value)
                  //  print(jsonData)
                    guard let arr = jsonData["items"].array else{print("error to be array");
                        return }
                        for item in arr{
                            var channelobj = Channel()
                            let obj = item.dictionary
                            channelobj.imageurl = obj!["snippet"]!["thumbnails"]["medium"]["url"].string ?? "no"
                            channelobj.name = obj!["snippet"]!["title"].string ?? "no"
                            channelobj.id = obj!["id"]?.string ?? ""
                            self.channelarr.append(channelobj)
                            helper.sortedData()
                    }               
                    }
                   completion(issuccess)
                }
            }
        
        
    }//end loadChannel
    
    // under edititng
//    class func loadListItems(ChannelID:String,completion:@escaping (Bool)->Void){
//        let listsInChannel = "https://www.googleapis.com/youtube/v3/playlists"
//        let api = "AIzaSyB43vfEpUD3NFH5ZV3l1UXcJOZ5aZ7SIZQ"
//        let parameter2 = ["part":"snippet","channelId":ChannelID,"key":api] as [String : Any]
//        Alamofire.request(listsInChannel, method: .get, parameters: parameter2, encoding: URLEncoding.default, headers: nil) .responseJSON { (response) in
//            if response.result.isSuccess{
//                let jsonData:JSON = JSON(response.result.value)
//                guard let arrayOfdata = jsonData["items"].array else{print("error to be array");
//                    return }
//                    var video = ItemOfList()
//                    for item in arrayOfdata{
//                        var obj = item.dictionary
//                        video.profileimg = obj!["snippet"]!["thumbnails"]["medium"]["url"].string ?? ""
//                        video.title = obj!["snippet"]!["title"].string ?? ""
//                        video.videoId = obj!["snippet"]!["resourceId"]["videoId"].string ?? ""
//                         self.listofvideos.append(video)
//                }
//                completion(true)
//            }
//        }
//    }
    
    class func sortedData(){
      helper.channelVMarr = helper.channelarr.map{return ChannelVM(chanob: $0)}
    }
    
//   class func getsubscribe(IdChannel:String){
//        let url = "https://www.googleapis.com/youtube/v3/subscriptions?part=snippet&key=[\(helper.api)]"
//        let resourceId = ["kind":"youtube#channel", "channelId": IdChannel]
//        let snippet = ["resourceId": resourceId]
//        let parms : [String:Any] = ["snippet":snippet]
//        let headers = ["Authorization":" Bearer [yout api token]","Accept":" application/json","Content-Type": "application/json"]
//        Alamofire.request(url, method: .post, parameters: parms, encoding: URLEncoding.default, headers: headers) .responseJSON { (response) in
//            if response.result.isSuccess{
//                let jsonData:JSON = JSON(response.result.value)
//                print("json is \(jsonData)")
//            }
//        }
//    }
    
    
    
    
}
