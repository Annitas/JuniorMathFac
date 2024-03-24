//
//  TMainScreenView.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 12.03.2024.
//

import UIKit
import SnapKit

final class TMainScreenView: UIView {
    private let profileContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .customGreen
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let profileLabel: UILabel = {
        let label = UILabel()
        label.text = "Профиль"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let backGroundImage: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.image = UIImage(named: "backgroundImage")
        return iv
    }()
    
    private let backGroundCardImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.image = UIImage(named: "greenCardBackground")
        return iv
    }()
    
    private let avatarImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.image = UIImage(named: "catAvatar")
        iv.layer.cornerRadius = 50
        return iv
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Маргарита \n Джинджолия"
        label.numberOfLines = 2
        label.textColor = .white
        label.shadowColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private let makeRoomButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.buttonSize = .large
        configuration.baseBackgroundColor = .button
        configuration.baseForegroundColor = .buttonText
        var container = AttributeContainer()
        container.font = UIFont.boldSystemFont(ofSize: 20)
        configuration.attributedTitle = AttributedString("Создать комнату", attributes: container)
        let button = UIButton(configuration: configuration, primaryAction: nil)
        configuration.titleAlignment = .center
        return button
    }()
    
    private let statisticsButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.buttonSize = .large
        configuration.baseBackgroundColor = .button
        configuration.baseForegroundColor = .buttonText
        var container = AttributeContainer()
        container.font = UIFont.boldSystemFont(ofSize: 20)
        configuration.attributedTitle = AttributedString("Статистика", attributes: container)
        let button = UIButton(configuration: configuration, primaryAction: nil)
        configuration.titleAlignment = .center
        return button
    }()
    
    private let tasksButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.buttonSize = .large
        configuration.baseBackgroundColor = .button
        configuration.baseForegroundColor = .buttonText
        var container = AttributeContainer()
        container.font = UIFont.boldSystemFont(ofSize: 20)
        configuration.attributedTitle = AttributedString("Задачи", attributes: container)
        let button = UIButton(configuration: configuration, primaryAction: nil)
        configuration.titleAlignment = .center
        return button
    }()
    
    private let rulesButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.buttonSize = .large
        configuration.baseBackgroundColor = .button
        configuration.baseForegroundColor = .buttonText
        var container = AttributeContainer()
        container.font = UIFont.boldSystemFont(ofSize: 20)
        configuration.attributedTitle = AttributedString("Правила", attributes: container)
        let button = UIButton(configuration: configuration, primaryAction: nil)
        configuration.titleAlignment = .center
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(backGroundImage)
        addSubview(backGroundCardImageView)
        addSubview(profileContainerView)
        backGroundCardImageView.addSubview(avatarImageView)
        backGroundCardImageView.addSubview(nameLabel)
        profileContainerView.addSubview(profileLabel)
        addSubview(makeRoomButton)
        addSubview(statisticsButton)
        addSubview(tasksButton)
        addSubview(rulesButton)
        addConstraints()
    }
    
    private func addConstraints() {
        profileContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.centerX.equalToSuperview()
            make.width.equalTo(profileLabel.intrinsicContentSize.width + 100) // Добавляем отступы
            make.height.equalTo(profileLabel.intrinsicContentSize.height + 30) // Добавляем отступы
        }
        
        profileLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        backGroundCardImageView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.95)
            make.top.equalTo(profileContainerView.snp.bottom).offset(20)
            make.height.equalToSuperview().multipliedBy(0.25)
            make.centerX.equalToSuperview()
        }
        
        backGroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.35) 
        }
        
        avatarImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-20)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        makeRoomButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(backGroundCardImageView.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
        
        statisticsButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(makeRoomButton.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
        
        tasksButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(statisticsButton.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
        
        rulesButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(tasksButton.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(profileContainerView)
        profileContainerView.addSubview(profileLabel)
        
        addConstraints()
    }
}
