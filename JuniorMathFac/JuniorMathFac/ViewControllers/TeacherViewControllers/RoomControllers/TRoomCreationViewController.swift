//
//  TRoomCreationView.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 02.04.2024.
//

import UIKit
import SnapKit

final class TRoomCreationViewController: UIViewController {
    private let backGroundImage: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.image = UIImage(named: "backgroundImage")
        return iv
    }()
    
    private let createRoomHeader = CustomHeaderTitle(title: "Новая комната")
    
    private let backGroundCardView: UIView = {
        let view = UIView()
        view.backgroundColor = .customGreen
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let roomTitleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Название комнаты"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.autocapitalizationType = .none
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        return textField
    }()
    
    private let studentCountTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "0"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.autocapitalizationType = .none
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        return textField
    }()
    
    private let addTasksButton = CustomButton(title: "Добавить задачи")
    private let createRoomButton = CustomButton(title: "Создать комнату")
    
    let options = ["Third Class", "Fourth Class", "Fifth Class", "Sixth Class"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addConstraints()
    }
    private func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(backGroundImage)
        view.addSubview(createRoomHeader)
        view.addSubview(createRoomHeader)
        view.addSubview(backGroundCardView)
        backGroundCardView.addSubview(roomTitleTextField)
        backGroundCardView.addSubview(studentCountTextField)
        view.addSubview(addTasksButton)
        view.addSubview(createRoomButton)
        
        addTasksButton.configuration?.baseBackgroundColor = .white
        addTasksButton.layer.borderColor = UIColor.blue.cgColor
        addTasksButton.layer.cornerRadius = 10
        addTasksButton.layer.borderWidth = 2
    }
    private func addConstraints() {
        backGroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.40)
        }
        
        createRoomHeader.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
        }
        
        roomTitleTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        backGroundCardView.snp.makeConstraints { make in
            make.top.equalTo(createRoomHeader.snp.bottom).offset(10)
            make.bottom.equalTo(studentCountTextField.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-23)
        }
        studentCountTextField.snp.makeConstraints { make in
            make.top.equalTo(roomTitleTextField.snp.bottom).offset(10)
            make.width.equalTo(100)
            make.right.equalTo(roomTitleTextField.snp.right)
        }
        createRoomButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
        
        addTasksButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(createRoomButton.snp.top).offset(-20)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
        
    }
}
