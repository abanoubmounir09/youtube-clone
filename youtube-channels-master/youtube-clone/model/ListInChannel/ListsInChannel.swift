//
//  ListsInChannel.swift
//  youtube-clone
//
//  Created by pop on 4/5/20.
//  Copyright © 2020 pop. All rights reserved.
//  Model

import Foundation

class ListsInChannel:CustomStringConvertible{
    
    var imageUrl:String?
    var title:String?
    var playlistId:String?
    
    var description: String{
        return "title is \(title)"
    }
}
