//
//  SearchCollectionViewCell.swift
//  marvelous
//
//  Created by Ciko Edo Febrian on 28/06/23.
//

import UIKit

class CustomButton: UIButton {
    
    enum FontSize {
        case big
        case med
        case small
    }
    
    init(title: String, hasBackground: Bool = false, fontSize: FontSize) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        
        self.backgroundColor = hasBackground ? UIColor.init(hexString: "#e23636"): .clear
        
        let titleColor: UIColor = hasBackground ? .white : UIColor.init(hexString: "#e23636")
        self.setTitleColor(titleColor, for: .normal)
        
        switch fontSize {
        case .big:
            self.titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
            
        case .med:
            self.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
            
        case .small:
            self.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
