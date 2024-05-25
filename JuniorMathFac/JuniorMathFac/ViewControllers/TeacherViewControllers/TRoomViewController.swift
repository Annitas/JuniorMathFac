//
//  TRoomViewController.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 02.04.2024.
//

import UIKit
import SnapKit
// MARK: Should be in statistics
final class TRoomViewController: UIViewController {
    private let backGroundImage: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.image = UIImage(named: "backgroundImage")
        return iv
    }()
    
    private let backGroundCardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.opacity = 0.75
        return view
    }()
    
    private let roomLabelHeader = CustomHeaderTitle(title: "Комната")
    
    private let examTitle: UILabel = {
        let label = UILabel()
        label.text = "Проверочная работа № 1"
        return label
    }()
    
    private let classTitle: UILabel = {
        let label = UILabel()
        label.text = "4 Класс"
        return label
    }()
    
    private let examDate: UILabel = {
        let label = UILabel()
        label.text = "06.03.2345"
        return label
    }()
    
    private let tasksButton = CustomButton(title: "Задачи")
    private let studentsButton = CustomButton(title: "Студенты")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tasksButton.addTarget(self, action: #selector(openTasks), for: .touchUpInside)
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(backGroundImage)
        view.addSubview(roomLabelHeader)
        view.addSubview(backGroundCardView)
        backGroundCardView.addSubview(examTitle)
        backGroundCardView.addSubview(classTitle)
        backGroundCardView.addSubview(examDate)
        view.addSubview(tasksButton)
        view.addSubview(studentsButton)

        addConstraints()
    }
    
    @objc func openTasks() {
        navigationController?.pushViewController(TTasksListViewController(), animated: true)
    }
    
    @objc func openStudents() {
        navigationController?.pushViewController(TTasksListViewController(), animated: true)
    }
    
    private func addConstraints() {
        backGroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.40)
        }
        
        roomLabelHeader.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
        }
        
        backGroundCardView.snp.makeConstraints { make in
            make.top.equalTo(roomLabelHeader.snp.bottom).offset(10)
            make.height.equalTo(view.intrinsicContentSize.height + 75)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-23)
        }
        
        examTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
        }
        classTitle.snp.makeConstraints { make in
            make.top.equalTo(examTitle.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(10)
        }
        
        examDate.snp.makeConstraints { make in
            make.top.equalTo(examTitle.snp.bottom).offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        
        tasksButton.snp.makeConstraints { make in
            make.top.equalTo(backGroundCardView.snp.bottom).offset(10)
            make.left.equalTo(backGroundCardView.snp.left)
            make.width.equalTo(150)
        }
        studentsButton.snp.makeConstraints { make in
            make.top.equalTo(backGroundCardView.snp.bottom).offset(10)
            make.right.equalTo(backGroundCardView.snp.right)
            make.width.equalTo(150)
        }
    }
}
