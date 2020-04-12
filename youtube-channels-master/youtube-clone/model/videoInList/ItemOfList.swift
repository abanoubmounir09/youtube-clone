//
//  ItemOfList.swift
//  youtube-clone
//
//  Created by pop on 4/3/20.
//  Copyright © 2020 pop. All rights reserved.
//

import Foundation

class ItemOfList:CustomStringConvertible{
    var profileimg:String?
    var title:String?
    var videoId:String?
    var description: String{
        return "title is \(title) and videoId \(videoId) "
    }
}
