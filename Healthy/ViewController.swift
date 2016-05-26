//
//  ViewController.swift
//  Healthy
//
//  Created by caiyueli on 16/5/25.
//  Copyright © 2016年 ard. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var posts: Array = [String]()
    
    
    //    var dict: Dictionary = []()
    //
    //    dict[@"title"] = title;
    //    dict[@"description"] = description;
    
    
    //let dictPost: Dictionary<String,AnyObject> = ["title": title,"description":description()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(.GET, "http://private-423eaf-health5.apiary-mock.com/posts")
            .validate()
            .responseJSON { response in
                
                //guard response.result.value != nil else { return }
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
                
    }


}

