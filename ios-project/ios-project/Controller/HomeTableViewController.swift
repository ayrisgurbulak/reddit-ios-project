//
//  HomeTableViewController.swift
//  ios-project
//
//  Created by Ayris Gürbulak on 26.01.2022.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    var postManager = PostDataManager()
    
    var postList: [Children] = []
    
    let cellSpacingHeight: CGFloat = 0
    let screenSize: CGRect = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchPostData()
    }
    
    func fetchPostData() {
        postManager.fetchPostData { posts in
            posts.data.children.forEach { post in
                DispatchQueue.main.async {
                    self.postList.append(post)
                    self.tableView.reloadData()
                }
            }
        }
    }
    
}

// MARK: - Table view data source

extension HomeTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return postList.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: C.homeCellIdentifier, for: indexPath) as! HomeTableViewCell
        
        let post = postList[indexPath.section]
        
        cell.authorName.text! = "@" + post.data.author_fullname!
        cell.postTitle.numberOfLines = 0
        cell.postTitle.text! = post.data.title!
        
        let imageUrl = URL(string: post.data.thumbnail!)
        if let data = try? Data(contentsOf: imageUrl!)
        {
            cell.postImage.contentMode = .scaleAspectFill
            let image = UIImage(data: data)
            cell.postImage.image = image
        }
        
        return cell
    }
    
}
