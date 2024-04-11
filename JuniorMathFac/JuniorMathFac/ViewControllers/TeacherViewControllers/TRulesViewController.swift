//
//  SettingsView.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 14.03.2024.
//

import UIKit
import SnapKit

final class TRulesViewController: UIViewController {
    private let profileHeader = CustomHeaderTitle(title: "Правила")
    private let backGroundImage: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.image = UIImage(named: "backgroundImage")
        return iv
    }()
    private let backGroundCardView: UIView = {
        let view = UIView()
        view.backgroundColor = .customGreen
        view.layer.cornerRadius = 10
        return view
    }()
    private let rulesTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.text = "Когда ученики входят в комнату - начинается игра. У каждого из них по три жизни, их задача - решать задачи, появляющиеся на экране. Решение каждой из них дает возможность восстановления своей потерянной жизни или же выстрела в другого игрока. Восстанавливать жизни себе запрещено первые два хода, также нельзя потерять больше одной за раунд. В конце игры идет подсчет полученных выстрелов и лечений. Цель - остаться на поляне с 3 жизнями, если у ученика заканчиваются жизни, а самостоятельная работа еще идет, то он получает пример решив который у него будет 1 жизнь"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupVeiw()
        addConstraints()
    }
    
    private func setupVeiw() {
        view.addSubview(backGroundImage)
        view.addSubview(profileHeader)
        view.addSubview(backGroundCardView)
        backGroundCardView.addSubview(rulesTextLabel)
    }
    
    private func addConstraints() {
        profileHeader.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(8)
        }
        
        backGroundCardView.snp.makeConstraints { make in
            make.top.equalTo(profileHeader.snp.bottom).offset(10)
            make.width.equalToSuperview().multipliedBy(0.90)
            make.centerX.equalToSuperview()
            make.height.equalTo(rulesTextLabel.snp.height).offset(30)
        }
        
        rulesTextLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.90)
        }
        backGroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.40)
        }
    }
}

