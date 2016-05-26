//
//  Post.swift
//  Healthy
//
//  Created by caiyueli on 16/5/25.
//  Copyright © 2016年 ard. All rights reserved.
//

import UIKit

class Post: NSObject {
    
    var id: Int?
    var image_url: String?
    var title: String?
    var desc: String?
    
    override init() {
        super.init()
    }
    
    init(id: Int, image_url: String, title: String, desc: String) {
        
        super.init()
        
        self.id = id
        self.image_url = image_url
        self.title = title
        self.desc = desc
    }

}
