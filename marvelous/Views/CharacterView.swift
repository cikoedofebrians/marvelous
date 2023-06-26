//
//  CharacterView.swift
//  marvelous
//
//  Created by Ciko Edo Febrian on 27/06/23.
//

import UIKit

class CharacterView: UIView {
    
    let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemRed
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ambatukam", for: .normal)
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBlue
        layer.cornerRadius = 10
        addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
