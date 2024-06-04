//
//  SMainScreenViewController.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 03.06.2024.
//

import UIKit

final class SMainScreenViewController: UIViewController {
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
        iv.image = UIImage(named: "foxAvatar")
        iv.layer.cornerRadius = 30
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
    
    private let availableRoomButton = CustomButton(title: "Доступные комнаты")
    private let statisticsButton = CustomButton(title: "Результаты")
    private let rulesButton = CustomButton(title: "Правила")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addConstraints()
    }
    
    @objc func openAvailableRoom() {
        navigationController?.pushViewController(SAvailableRoomsController(), animated: true)
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
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(backGroundImage)
        view.addSubview(backGroundCardImageView)
        backGroundCardImageView.addSubview(avatarImageView)
        backGroundCardImageView.addSubview(nameLabel)
        backGroundImage.addSubview(profileHeader)
        view.addSubview(availableRoomButton)
        view.addSubview(statisticsButton)
        view.addSubview(rulesButton)
        availableRoomButton.addTarget(self, action: #selector(openAvailableRoom), for: .touchUpInside)
        statisticsButton.addTarget(self, action: #selector(openStatistics), for: .touchUpInside)
        rulesButton.addTarget(self, action: #selector(openRules), for: .touchUpInside)
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
        
        availableRoomButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(backGroundCardImageView.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
        
        statisticsButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(availableRoomButton.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
        
        rulesButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(statisticsButton.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
    }
}
