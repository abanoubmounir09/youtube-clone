//
//  ItemsList.swift
//  youtube-clone
//
//  Created by pop on 4/3/20.
//  Copyright © 2020 pop. All rights reserved.
//

import UIKit
import youtube_ios_player_helper
import Pods_youtube_clone
import Alamofire
import SwiftyJSON

class ItemsList: UITableViewController {
    var ListId:String?
   var listofvideos = [ItemOfList]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadListItems(ListId: ListId!)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    
    
//    func loaddata(){
//        loadListItems(ListId: "PL0dzCUj1L5JH5wDLTKAmzFgsuxum") { (true) in
//             self.tableView.reloadData()
//        }
    
    }
    
    func loadListItems(ListId:String){
        let listitemurl = "https://www.googleapis.com/youtube/v3/playlistItems"
        let api = "AIzaSyB43vfEpUD3NFH5ZV3l1UXcJOZ5aZ7SIZQ"
        let parameter2 = ["part":"snippet","playlistId":ListId,"key":api] as [String : Any]
        Alamofire.request(listitemurl, method: .get, parameters: parameter2, encoding: URLEncoding.default, headers: nil) .responseJSON { (response) in
            if response.result.isSuccess{
                let jsonData:JSON = JSON(response.result.value)
               // print(jsonData)
                guard let arrayOfdata = jsonData["items"].array else{print("error  item to be array");
                    return }
                for item in arrayOfdata{
                     var video = ItemOfList()
                    var obj = item.dictionary
                    video.profileimg = obj!["snippet"]!["thumbnails"]["medium"]["url"].string ?? ""
                    video.title = obj!["snippet"]!["title"].string ?? ""
                    video.videoId = obj!["snippet"]!["resourceId"]["videoId"].string ?? ""
                    self.listofvideos.append(video)
                    self.tableView.reloadData()
                }
                
            }
        }
}

   

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listofvideos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemOfListCell", for: indexPath) as? ItemOfListcell
        var item = listofvideos[indexPath.row]
        cell?.item = item
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 7.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let videoVC = storyboard?.instantiateViewController(withIdentifier: "videoVC") as? videoPlay
        videoVC?.videoID = listofvideos[indexPath.row].videoId
        navigationController?.pushViewController(videoVC!, animated: true)
        print("video id is - \(videoVC?.videoID )")
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
