//
//  CustomButton.swift
//  Navigation
//
//  Created by Stas Sukhanov on 18.03.2023.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    
    var buttonAction : () -> Void = {}
    
    @objc private func buttonTapped(){
        buttonAction()
    }
    
    init(title: String, backgroundColor: UIColor = .systemBlue, cornerRadius: CGFloat = 0, maskToBounds : Bool = true){
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = maskToBounds
        self.setTitleColor(UIColor.white, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
