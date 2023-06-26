//
//  MyCell.swift
//  marvelous
//
//  Created by Ciko Edo Febrian on 27/06/23.
//

import UIKit
import CollectionViewPagingLayout

class MyCell: UICollectionViewCell {
    var card: UIView!
      
      override init(frame: CGRect) {
          super.init(frame: frame)
          setup()
      }
      
      required init?(coder: NSCoder) {
          super.init(coder: coder)
          setup()
      }
      
      func setup() {
          card = CharacterView(frame: .zero)
          card.translatesAutoresizingMaskIntoConstraints = false

          contentView.addSubview(card)
          
          NSLayoutConstraint.activate([
              card.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
              card.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
              card.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
              card.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -120),
          ])
      }
}

extension MyCell: ScaleTransformView {
    var scaleOptions: ScaleTransformViewOptions {
        .layout(.linear)
    }
}


//extension MyCell: TransformableView {
//    func transform(progress: CGFloat) {
//        let alpha = 1 - abs(progress)
//        contentView.alpha = alpha
//    }
//}
