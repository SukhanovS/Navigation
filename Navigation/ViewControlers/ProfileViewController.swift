//
//  SecondScreen.swift
//  Navigation
//
//  Created by Stas Sukhanov on 15.08.2022.
//
import Foundation
import UIKit
import StorageService



class ProfileViewController: UIViewController{
    
    var user_1 : User = User(fullName: "", status: "", avatar: UIImage())
    
    lazy private var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionFooterHeight = 0
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "postTableCellIdentifier")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultTableCellIdentifier")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .systemGray
        view.addSubview(tableView)
        //                layout()
        addConstraints()
        
        
        
#if DEBUG
        view.backgroundColor = .systemRed
#else
        view.backgroundColor = .systemGray
#endif
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    func addConstraints(){
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
extension ProfileViewController : UITableViewDelegate {
    
//    открыть фото по нажатию
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            let photosViewController = PhotosViewController()
            navigationController?.pushViewController(photosViewController, animated: false)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let profile = ProfileHeaderView()
            profile.setup(user: user_1)
                       return profile
        }
        return nil
    }
}

extension ProfileViewController : UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        
        if section == 1 {
            return posts.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            return PhotoTableViewCell()
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "postTableCellIdentifier", for: indexPath) as? PostTableViewCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "defaultTableCellIdentifier", for: indexPath)
                return cell
            }
            
            //        применение фильтров
            
            //            let filter = ImageProcessor()
            //
            //            if let sImage = post.image {
            //                filter.processImage(sourceImage: sImage, filter: .colorInvert) {
            //                    filteredImage in post.image = filteredImage
            //                }
            //            }
            
            let post = posts[indexPath.row]
            
            let PostViewModel = PostTableViewCell.ViewModel(
                autor: post.author,
                descriptionText: post.description,
                likes: "Likes: \(post.likes)",
                views: "Views: \(post.views)",
                image: post.image
            )
            cell.setup(with: PostViewModel)
            return cell
            
        } else {
            return tableView.dequeueReusableCell(withIdentifier: "defaultTableCellIdentifier", for: indexPath)
        }
    }
    
    
    
    
    
}
