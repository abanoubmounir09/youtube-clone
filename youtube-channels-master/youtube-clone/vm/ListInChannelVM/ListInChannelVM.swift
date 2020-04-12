//
//  ListInChannelVM.swift
//  youtube-clone
//
//  Created by pop on 4/5/20.
//  Copyright © 2020 pop. All rights reserved.
//

import Foundation

class ListsInChannelVM:CustomStringConvertible{
    var imageUrl:String?
    var title:String?
    var playlistId:String?
    
    init(list:ListsInChannel) {
        self.imageUrl = list.imageUrl
        self.title = list.title
        self.playlistId = list.playlistId
    }
    var description: String{
        return "title is \(title)"
    }
    
}
