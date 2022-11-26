//
//  PostTableView.swift
//  Navigation
//
//  Created by Stas Sukhanov on 23.09.2022.
//

import Foundation
import UIKit


class PostTableViewCell: UITableViewCell {
    
    struct ViewModel {
        let autor: String
        let descriptionText: String
        let likes : String
        let views: String
        let image: UIImage?
        
    }
    
    private lazy var autor : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Chelsea FC"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 2
        
        return label
    }()
    
    private lazy var img : UIImageView = {
        let img = UIImageView()
        img.image =  UIImage(named: "chelsea")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.backgroundColor = .black
        return img
    }()
    
    private lazy var descriptionText : UILabel = {
        let descriptionText = UILabel()
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        descriptionText.text = "Футбольный клуб Челси"
        descriptionText.textColor = .systemGray
        descriptionText.font = UIFont.systemFont(ofSize: 14.0)
        descriptionText.numberOfLines = 0
        return descriptionText
    }()
    
    private lazy var likes : UILabel = {
        let likes = UILabel()
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.text = "Likes: 77"
        likes.textColor = .black
        likes.font = UIFont.systemFont(ofSize: 16.0)
        return likes
    }()
    
    private lazy var views : UILabel = {
        let views = UILabel()
        views.translatesAutoresizingMaskIntoConstraints = false
        views.text = "Views: 100"
        views.textColor = .black
        views.font = UIFont.systemFont(ofSize: 16.0)
        return views
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addViews()
        addConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with viewModel: ViewModel) {
        
        self.autor.text = viewModel.autor
        self.descriptionText.text = viewModel.descriptionText
        self.likes.text = viewModel.likes
        self.views.text = viewModel.views
        self.img.image = viewModel.image
    }
    
    func addViews(){
        self.contentView.addSubview(autor)
        self.contentView.addSubview(img)
        self.contentView.addSubview(descriptionText)
        self.contentView.addSubview(likes)
        self.contentView.addSubview(views)
    }
    
    
    func addConstraints(){
        NSLayoutConstraint.activate([
            self.autor.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            self.autor.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 16),
            self.autor.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -16),
            
            self.img.topAnchor.constraint(equalTo: self.autor.bottomAnchor, constant: 12),
            self.img.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0),
            self.img.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0),
            self.img.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            self.descriptionText.topAnchor.constraint(equalTo: self.img.bottomAnchor, constant: 16),
            self.descriptionText.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 16),
            self.descriptionText.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -16),
            
            self.likes.topAnchor.constraint(equalTo: self.descriptionText.bottomAnchor, constant: 16),
            self.likes.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 16),
            
            self.views.topAnchor.constraint(equalTo: self.descriptionText.bottomAnchor, constant: 16),
            self.views.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -16),
            
            self.contentView.bottomAnchor.constraint(equalTo: self.views.bottomAnchor, constant: 16)
            
        ])
    }
}



