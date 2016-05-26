//
//  PostViewController.swift
//  Healthy
//
//  Created by caiyueli on 16/5/25.
//  Copyright © 2016年 ard. All rights reserved.
//

import UIKit
import Alamofire
import Haneke



class PostsViewController: UITableViewController {
    var posts: Array = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.Json()
       
        refreshControl?.addTarget(self, action: #selector(refreshData), forControlEvents: UIControlEvents.ValueChanged)
        
                let webView = UIWebView(frame:self.view.bounds)
                let url = NSURL(string: "http://baidu.com")
                let request = NSURLRequest(URL: url!)
                webView.loadRequest(request)
                self.view.addSubview(webView)
    }
    
    func refreshData(){
        self.posts.removeAll()
        
        self.Json()
        
        self.refreshControl!.endRefreshing()
    }
    
    // 下拉刷新
    func Json(){
        Alamofire.request(.GET, "http://private-423eaf-health5.apiary-mock.com/posts")
            .validate()
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    
                    for item in JSON as! NSArray {
                        let post = Post()
                        post.id = item["id"] as? Int
                        post.title = item["title"] as? String
                        post.desc = item["description"] as? String
                        post.image_url = item["image_url"] as? String
                        
                        self.posts.append(post)
                        
                    }
                    self.tableView.reloadData()
                }
                
        }
        
        
    }
    
    
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! PostTableViewCell
        
        // Configure the cell...
        
        let post = self.posts[indexPath.row]
        let url = NSURL(string: post.image_url!)
        
        cell.postTitleLabel.text = post.title
        cell.postDescLabel.text = post.desc
        cell.postImage.hnk_setImageFromURL(url!)
        
        return cell
    }
    
}
