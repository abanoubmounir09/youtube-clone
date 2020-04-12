//
//  ListsInChannelVC.swift
//  youtube-clone
//
//  Created by pop on 4/5/20.
//  Copyright © 2020 pop. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ListsInChannelVC: UITableViewController {
    var channelID:String?
    var listsiNchannel = [ListsInChannel]()
    var ListsVMArray = [ListsInChannelVM]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "lists"
        loadListItems(ChannelID:channelID!)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // LoadLists for each chhanel
    func loadListItems(ChannelID:String){
        let listsInChannel = "https://www.googleapis.com/youtube/v3/playlists"
        let api = "AIzaSyB43vfEpUD3NFH5ZV3l1UXcJOZ5aZ7SIZQ"
        let parameter2 = ["part":"snippet","channelId":ChannelID,"key":api] as [String : Any]
        Alamofire.request(listsInChannel, method: .get, parameters: parameter2, encoding: URLEncoding.default, headers: nil) .responseJSON { (response) in
            if response.result.isSuccess{
                let jsonData:JSON = JSON(response.result.value)
                guard let arrayOfdata = jsonData["items"].array else{print("error to be array");
                    return }
                for item in arrayOfdata{
                     var list = ListsInChannel()
                    var obj = item.dictionary
                    list.playlistId = obj!["id"]!.string ?? ""
                    list.title = obj!["snippet"]!["title"].string ?? ""
                    list.imageUrl = obj!["snippet"]!["thumbnails"]["default"]["url"].string ?? ""
//                    print("list is -> \(list)")
                    self.listsiNchannel.append(list)
                    self.tableView.reloadData()
                }
                self.sortedData()
            }
        }
    }
    
   // transform data to VM
    func sortedData(){
       ListsVMArray = listsiNchannel.map{return ListsInChannelVM(list: $0)}
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ListsVMArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListInChannel", for: indexPath) as? ListInChannelView
        cell?.list = ListsVMArray[indexPath.row]

        return cell!
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 7.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemInlist = storyboard?.instantiateViewController(withIdentifier: "ItemOfList") as?ItemsList
        itemInlist?.ListId = ListsVMArray[indexPath.row].playlistId
        navigationController?.pushViewController(itemInlist!, animated: true)
        
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
