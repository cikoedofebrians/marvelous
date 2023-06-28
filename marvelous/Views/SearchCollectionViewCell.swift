//
//  SearchCollectionViewCell.swift
//  marvelous
//
//  Created by Ciko Edo Febrian on 28/06/23.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell{
    
    static let identifier = "SearchCollectionViewCell"
    
    let nameView = CharacterNameCellView(frame: .zero)
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
        contentView.addSubview(nameView)
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 10
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
        NSLayoutConstraint.activate([
            nameView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            nameView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configure(with model: Character){
        nameView.configure(name: model.name)
        posterImageView.sd_setImage(with: URL(string: "\(model.thumbnail.path).\(model.thumbnail.fileExtension)"))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
