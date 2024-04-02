//
//  TRoomViewController.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 02.04.2024.
//

import UIKit
import SnapKit

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
        view.layer.opacity = 0.4
        return view
    }()
    
    private let roomLabel = CustomHeaderTitle(title: "Комната")
    
    private let examTitle: UILabel = {
        let label = UILabel()
        label.text = "Exam number 1"
        return label
    }()
    
    private let classTitle: UILabel = {
        let label = UILabel()
        label.text = "Class 4"
        return label
    }()
    
    private let examDate: UILabel = {
        let label = UILabel()
        label.text = "06.03.2345"
        return label
    }()
    
    private let tasksButton = CustomButton(title: "Tasks")
    private let studentsButton = CustomButton(title: "Students")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(backGroundImage)
        view.addSubview(roomLabel)
        view.addSubview(backGroundCardView)
        backGroundCardView.addSubview(examTitle)
        backGroundCardView.addSubview(classTitle)
        backGroundCardView.addSubview(examDate)
        backGroundImage.addSubview(tasksButton)
        backGroundImage.addSubview(studentsButton)
        addConstraints()
    }
    
    private func addConstraints() {
        backGroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.35)
        }
        
        roomLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
        }
        
        backGroundCardView.snp.makeConstraints { make in
            make.top.equalTo(roomLabel.snp.bottom).offset(10)
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
