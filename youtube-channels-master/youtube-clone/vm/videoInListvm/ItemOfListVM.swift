//
//  ItemOfListVM.swift
//  youtube-clone
//
//  Created by pop on 4/3/20.
//  Copyright © 2020 pop. All rights reserved.
//

import Foundation

class ItemOfListVM{
    var profileimg:String?
    var title:String?
    
    init(item:ItemOfList){
        self.profileimg = item.profileimg
        self.title = item.title
    }
}
