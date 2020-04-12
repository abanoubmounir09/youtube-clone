//
//  ItemOfListcell.swift
//  youtube-clone
//
//  Created by pop on 4/3/20.
//  Copyright © 2020 pop. All rights reserved.
//

import UIKit

class ItemOfListcell: UITableViewCell {
   
    @IBOutlet weak var imgUrl: UIImageView!
    @IBOutlet weak var videoLb: UILabel!
    
    var item:ItemOfList!{
        didSet{
            videoLb.text = item.title
            let url = URL(string: item.profileimg!)
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url!)
                DispatchQueue.main.async {
                    let img = UIImage(data: data!)
                    self.imgUrl.image = img
                }
            }
        }
    }
}
