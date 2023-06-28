//
//  CharacterView.swift
//  marvelous
//
//  Created by Ciko Edo Febrian on 27/06/23.
//

import UIKit
import SDWebImage

class CharacterView: UIView {
    
    let imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = .white
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    
    let overviewLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = .white
        nameLabel.textAlignment = .justified
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    
    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(hexString: "#e23636")
        layer.cornerRadius = 10
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 140),
            imageView.heightAnchor.constraint(equalToConstant: 140)
        ])
        
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        
        addSubview(overviewLabel)
        
        NSLayoutConstraint.activate([
            overviewLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            overviewLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            overviewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant:  20),
            overviewLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            overviewLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -20),
        ])
        
    }
    
    
    
    public func configure(with model: Character){
        imageView.sd_setImage(with: URL(string: "\(model.thumbnail.path).\(model.thumbnail.fileExtension)"))
        nameLabel.text = model.name
        overviewLabel.text = model.description
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.makeRounded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
