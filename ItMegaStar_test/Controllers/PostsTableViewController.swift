//
//  PostsTableViewController.swift
//  ItMegaStar_test
//
//  Created by Максим Солнцев on 8/27/20.
//  Copyright © 2020 Максим Солнцев. All rights reserved.
//

import UIKit

class PostsTableViewController: UITableViewController {
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var loadMoreStatus = true
    var postsArray: [PostResponse] = []
    let network = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        network.fetchPosts() {posts in
            DispatchQueue.main.async {
                self.spinner.startAnimating()
                self.postsArray = posts
                self.tableView.reloadData()
            }
        }
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostsTableViewCell
        let article = postsArray[indexPath.row]
        
        cell.postsLabel.text = article.title
        cell.bodyLabel.text = article.body
        
        return cell
    }

    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if network.numberOfPage < 10 {  if offsetY > contentHeight - scrollView.frame.size.height {
            
            network.numberOfPage += 1
            network.fetchPosts { posts in
                
                DispatchQueue.main.async {
                    self.spinner.startAnimating()
                    self.postsArray = posts
                    self.tableView.reloadData()
                    
                    }
                }
            }
        }
    }
    
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as? OnePostViewController)?.postsDetail = postsArray[tableView.indexPathForSelectedRow!.row]
        tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
