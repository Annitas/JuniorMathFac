//
//  CustomButton.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 27.03.2024.
//

import UIKit

final class CustomButton: UIButton {
    
    init(title: String) {
        super.init(frame: .zero)
        var configuration = UIButton.Configuration.filled()
        configuration.buttonSize = .large
        configuration.baseBackgroundColor = .button
        configuration.baseForegroundColor = .buttonText
        var container = AttributeContainer()
        container.font = UIFont.boldSystemFont(ofSize: 20)
        configuration.attributedTitle = AttributedString(title, attributes: container)
        configuration.titleAlignment = .center
        self.configuration = configuration
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
