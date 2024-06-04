//
//  SRoomViewController.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 04.06.2024.
//

import UIKit

final class SRoomViewController: UIViewController {
    var viewModel = RoomModel(roomTitle: "", tasks: [], students: [])
    private let profileHeader = CustomHeaderTitle(title: "Контрольная работа")
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
    
    private let answerTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите ответ"
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
    
    let taskConditionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.white
        label.shadowColor = UIColor.lightGray
        label.shadowOffset = CGSize(width: 2, height: 2)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        taskConditionLabel.text = viewModel.tasks.first?.condition
        setupView()
    }
    
    private func setupView() {
        view.addSubview(backGroundImage)
        view.addSubview(profileHeader)
        view.addSubview(backGroundCardView)
        backGroundCardView.addSubview(taskConditionLabel)
        backGroundCardView.addSubview(answerTextField)
        
        profileHeader.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(8)
        }
        
        backGroundCardView.snp.makeConstraints { make in
            make.top.equalTo(profileHeader.snp.bottom).offset(10)
            make.width.equalToSuperview().multipliedBy(0.90)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(answerTextField.snp.bottom).offset(10)
        }
        
        taskConditionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.90)
        }
        
        answerTextField.snp.makeConstraints { make in
            make.top.equalTo(taskConditionLabel.snp.bottom).offset(15)
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
