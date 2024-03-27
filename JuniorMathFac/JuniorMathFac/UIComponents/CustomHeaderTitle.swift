//
//  CustomBackgroundCard.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 27.03.2024.
//

import UIKit

class CustomHeaderTitle: UIView {
    let label = UILabel()
    init(title: String) {
        super.init(frame: .zero)
        label.text = title
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        self.addSubview(label)
        
        backgroundColor = .customGreen
        layer.cornerRadius = 10
        self.snp.makeConstraints { make in
            make.width.equalTo(label.intrinsicContentSize.width + 100) // Добавляем отступы
            make.height.equalTo(label.intrinsicContentSize.height + 30) // Добавляем отступы
        }
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
