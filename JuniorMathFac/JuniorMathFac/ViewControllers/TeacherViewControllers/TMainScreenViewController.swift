//
//  TMainScreenView.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 12.03.2024.
//

import UIKit
import SnapKit

final class TMainScreenViewController: UIViewController {
    private let profileHeader = CustomHeaderTitle(title: "Профиль")
    
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
    
    private let makeRoomButton = CustomButton(title: "Создать комнату")
    private let statisticsButton = CustomButton(title: "Статистика")
    private let tasksButton = CustomButton(title: "Задачи")
    private let rulesButton = CustomButton(title: "Правила")
    
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(backGroundImage)
        view.addSubview(backGroundCardImageView)
        backGroundCardImageView.addSubview(avatarImageView)
        backGroundCardImageView.addSubview(nameLabel)
        backGroundImage.addSubview(profileHeader)
        view.addSubview(makeRoomButton)
        view.addSubview(statisticsButton)
        view.addSubview(tasksButton)
        view.addSubview(rulesButton)
        makeRoomButton.addTarget(self, action: #selector(openMakeRoom), for: .touchUpInside)
        statisticsButton.addTarget(self, action: #selector(openStatistics), for: .touchUpInside)
        tasksButton.addTarget(self, action: #selector(openTasks), for: .touchUpInside)
        rulesButton.addTarget(self, action: #selector(openRules), for: .touchUpInside)
        addConstraints()
    }
    
    @objc func openMakeRoom() {
        navigationController?.pushViewController(TRoomViewController(), animated: true)
    }
    
    @objc func openStatistics() {
        navigationController?.pushViewController(TStatisticsViewController(), animated: true)
    }
    
    @objc func openTasks() {
        navigationController?.pushViewController(TTasksViewController(), animated: true)
    }
    
    @objc func openRules() {
        navigationController?.pushViewController(TRulesViewController(), animated: true)
    }
    
    private func addConstraints() {
        profileHeader.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
        }
        
        backGroundCardImageView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.95)
            make.top.equalTo(profileHeader.snp.bottom).offset(20)
            make.height.equalToSuperview().multipliedBy(0.25)
            make.centerX.equalToSuperview()
        }
        
        backGroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.40) 
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
}
