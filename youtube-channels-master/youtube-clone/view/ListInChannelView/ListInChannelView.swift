//
//  ListInChannelView.swift
//  youtube-clone
//
//  Created by pop on 4/5/20.
//  Copyright © 2020 pop. All rights reserved.
//

import UIKit

class ListInChannelView: UITableViewCell {

    @IBOutlet weak var nameOfListLB: UILabel!
    
    
    var list:ListsInChannelVM!{
        didSet{
            nameOfListLB.text = list.title
        }
    }
    
    

}
