//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Stas Sukhanov on 4.11.2022.
//

import Foundation
import UIKit

class PhotosCollectionViewCell : UICollectionViewCell {

    
    private lazy var img : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func setup(with name: String) {
        self.img.image = UIImage(named: name)
    }

   
    private func setupView() {
        self.addSubview(img)

        NSLayoutConstraint.activate([
            img.topAnchor.constraint(equalTo: self.topAnchor),
            img.leftAnchor.constraint(equalTo: self.leftAnchor),
            img.rightAnchor.constraint(equalTo: self.rightAnchor),
            img.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

}


