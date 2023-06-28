//
//  CharacterCellNameView.swift
//  marvelous
//
//  Created by Ciko Edo Febrian on 28/06/23.
//

import UIKit

class CharacterNameCellView: UIView {
    
    let nameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(nameLabel)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemRed
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func configure(name: String){
        nameLabel.text = name
    }
    
}
