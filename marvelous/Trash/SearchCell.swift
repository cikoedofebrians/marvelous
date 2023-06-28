//
//  SearchCell.swift
//  marvelous
//
//  Created by Ciko Edo Febrian on 28/06/23.
//

import UIKit

class SearchCell: UITableViewCell {
    static let identifier = "SearchCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Spider-Man"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let characterImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "animage")
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(characterImageView)
        contentView.addSubview(label)

        contentView.backgroundColor = .systemRed
    }
    override func layoutSubviews() {
        configureConstraint()
    }
    
    func configureConstraint(){
        let characterImageConstraint = [
            characterImageView.widthAnchor.constraint(equalToConstant: 95),
            characterImageView.heightAnchor.constraint(equalToConstant: 95),
            characterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            characterImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        let labelConstraint = [
            label.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        NSLayoutConstraint.activate(characterImageConstraint)
        NSLayoutConstraint.activate(labelConstraint)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
