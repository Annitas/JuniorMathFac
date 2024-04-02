//
//  TTasksList.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 02.04.2024.
//

import UIKit
import SnapKit

final class TTasksListViewController: UIViewController {
    private let backGroundImage: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.image = UIImage(named: "backgroundImage")
        return iv
    }()
    
    private let tasksListLabel = CustomHeaderTitle(title: "Список задач")
    private let addTasksButton = CustomButton(title: "Добавить задачи")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(backGroundImage)
        view.addSubview(tasksListLabel)
        view.addSubview(addTasksButton)
        addConstraints()
    }
    
    private func addConstraints() {
        backGroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.35)
        }
        
        tasksListLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
        }
        
        addTasksButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
    }
}
