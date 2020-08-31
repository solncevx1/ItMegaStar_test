//
//  OnePostViewController.swift
//  ItMegaStar_test
//
//  Created by Максим Солнцев on 8/29/20.
//  Copyright © 2020 Максим Солнцев. All rights reserved.
//

import UIKit

class OnePostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var commentsTableView: UITableView!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var commentsArray: [CommentsResponse] = []
    var postsDetail: PostResponse!
    var network = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commentsTableView.delegate = self
        commentsTableView.dataSource = self
        bodyLabel.text = postsDetail.body
        titleLabel.text = postsDetail.title
        
        self.network.fetchComments(posId: postsDetail.id) { comments in
            
            DispatchQueue.main.async {
                self.commentsArray = comments
                self.commentsTableView.reloadData()
                print(self.commentsArray)
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CommentTableViewCell
        let article = commentsArray[indexPath.row]
        cell.nameLabel.text = article.name
        cell.emailLabel.text = article.email
        cell.commentLabel.text = article.body
        
        return cell
    }
    
    
    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
     func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
    
}
