//
//  TSettingsView.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 20.03.2024.
//

import UIKit
import SnapKit

final class TProfileSettingsViewController: UIViewController {
    private let profileHeader = CustomHeaderTitle(title: "Настройки")
    
    private let backGroundImage: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.image = UIImage(named: "backgroundImage")
        return iv
    }()
    
    private let accDataContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .customGreen
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let changePassContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .customGreen
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let accountDataTitle: UILabel = {
        let label = UILabel()
        label.text = "Данные аккаунта"
        return label
    }()
    
    private let fullUserName: UILabel = {
        let label = UILabel()
        label.text = "Margarite Gingolia Sergeevna"
        return label
    }()
    
    private let changePasswordTitle: UILabel = {
        let label = UILabel()
        label.text = "Change password"
        return label
    }()
    
    private let oldPasswordField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter new password"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        return textField
    }()
    
    private let newPasswordField: UITextField = {
        let textField = UITextField()
        textField.text = "Enter new password"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        return textField
    }()
    
    private let repeatPasswordField: UITextField = {
        let textField = UITextField()
        textField.text = "Repeat new password"
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        return textField
    }()
    
    private let resetPasswordButton = CustomButton(title: "Сменить пароль")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backGroundImage)
        backGroundImage.addSubview(profileHeader)
        view.addSubview(changePassContainerView)
        view.addSubview(accDataContainerView)
        
        view.backgroundColor = .systemBackground
        
        accDataContainerView.addSubview(accountDataTitle)
        accDataContainerView.addSubview(fullUserName)
        
        changePassContainerView.addSubview(changePasswordTitle)
        changePassContainerView.addSubview(oldPasswordField)
        changePassContainerView.addSubview(newPasswordField)
        changePassContainerView.addSubview(repeatPasswordField)
        
        view.addSubview(resetPasswordButton)
        addConstraints()
    }
    
    private func addConstraints() {
        profileHeader.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        backGroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.40)
        }
        
        accountDataTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
        }
        
        fullUserName.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(accountDataTitle.snp.bottom).offset(20)
        }
        
        changePasswordTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
        oldPasswordField.snp.makeConstraints { make in
            make.top.equalTo(changePasswordTitle.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.95)
        }
        newPasswordField.snp.makeConstraints { make in
            make.top.equalTo(oldPasswordField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.95)
        }
        repeatPasswordField.snp.makeConstraints { make in
            make.top.equalTo(newPasswordField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.95)
        }
        
        accDataContainerView.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-200)
            make.bottom.equalTo(backGroundImage.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-23)
        }
        
        changePassContainerView.snp.makeConstraints { make in
            make.top.equalTo(accDataContainerView.snp.bottom).offset(20)
            make.bottom.equalTo(repeatPasswordField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-23)
        }
        
        resetPasswordButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(changePassContainerView.snp.bottom).offset(20)
            make.width.equalToSuperview().offset(-23)
        }
    }
}
