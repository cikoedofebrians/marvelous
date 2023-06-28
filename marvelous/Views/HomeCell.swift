//
//  MyCell.swift
//  marvelous
//
//  Created by Ciko Edo Febrian on 27/06/23.
//

import UIKit
import CollectionViewPagingLayout

class HomeCell: UICollectionViewCell {
    
    static let identifier = "HomeCell"
    var card: CharacterView!
      
    override init(frame: CGRect) {
          super.init(frame: frame)
          setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
      func setup() {
          card = CharacterView(frame: .zero)
          card.translatesAutoresizingMaskIntoConstraints = false
          contentView.addSubview(card)
          NSLayoutConstraint.activate([
              card.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
              card.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
              card.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 140),
              card.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -240),
          ])
      }
    func configure(with model: Character) {
        card.configure(with: model)
    }
}

extension HomeCell: ScaleTransformView {
    var scaleOptions: ScaleTransformViewOptions {
        .layout(.linear)
    }
}
