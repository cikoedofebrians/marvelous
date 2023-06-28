//
//  CharacterDetailsViewController.swift
//  marvelous
//
//  Created by Ciko Edo Febrian on 27/06/23.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    
    let characterView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    var characterNameView: CharacterNameView = {
        let view = CharacterNameView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let readButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor.init(hexString: "#f78f3f")
        button.setTitle("Read Comics", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(characterView)
        view.addSubview(readButton)
        view.addSubview(characterNameView)
        view.addSubview(descriptionLabel)
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.tintColor = UIColor.label
        configureConstraint()

    }
    
    func configureButtonFunction(){
   
    }
//    
//    override func viewDidLayoutSubviews() {
//
//    }
//    
    
    func configureConstraint() {
        let characterViewConstraint =
        [
            characterView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            characterView.rightAnchor.constraint(equalTo: view.rightAnchor),
            characterView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width),
        ]
        
        let readButtonConstraint = [
            readButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            readButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            readButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            readButton.heightAnchor.constraint(equalToConstant: 50),
        ]

        let characterNameViewConstraint = [
            characterNameView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            characterNameView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            characterNameView.topAnchor.constraint(equalTo: characterView.bottomAnchor)
        ]
        
        let descriptionLabelConstraint = [
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionLabel.topAnchor.constraint(equalTo: characterNameView.bottomAnchor, constant: 20),
        ]
        
        NSLayoutConstraint.activate(characterViewConstraint)
        NSLayoutConstraint.activate(readButtonConstraint)
        NSLayoutConstraint.activate(characterNameViewConstraint)
        NSLayoutConstraint.activate(descriptionLabelConstraint)
        
    }
    
    
    func configure(with model: Character){
        characterView.sd_setImage(with: URL(string: "\(model.thumbnail.path).\(model.thumbnail.fileExtension)"))
        characterNameView.configure(title: model.name)
        descriptionLabel.text = model.description
        readButton.addAction(UIAction(handler: { [weak self] _ in
            if let comicLinkURL = model.urls.first(where: {$0.type == "comiclink"}) {
                let vc = ReadComicWebViewController()
                guard let comicURL = URL(string: comicLinkURL.url) else {return}
                vc.url = comicURL
                self?.navigationController?.pushViewController(vc, animated: true)
            }
         }), for: .primaryActionTriggered)
    }
    
    
}

