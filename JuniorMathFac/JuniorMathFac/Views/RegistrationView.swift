//
//  RegistrationView.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 17.02.2024.
//

import UIKit

import UIKit
import SnapKit

final class RegistrationView: UIView {
    private let registrationViewTitle: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "mainTextColor")
        label.text = "Регистрация"
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let enterEmailField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.layer.cornerRadius = 20
        textField.text = "example@example.ru"
        textField.layer.borderColor = UIColor.brown.cgColor
        textField.layer.borderWidth = 1.7
        textField.backgroundColor = .clear
        textField.textColor = UIColor(named: "mainTextColor")
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    private let enterPasswordField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.layer.cornerRadius = 20
        textField.text = "******"
        textField.layer.borderColor = UIColor.brown.cgColor
        textField.layer.borderWidth = 1.7
        textField.backgroundColor = .clear
        textField.textColor = UIColor(named: "mainTextColor")
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()
    private let reenterPasswordField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.layer.cornerRadius = 20
        textField.text = "******"
        textField.layer.borderColor = UIColor.brown.cgColor
        textField.layer.borderWidth = 1.7
        textField.backgroundColor = .clear
        textField.textColor = UIColor(named: "mainTextColor")
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()

    let registrationButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = UIColor(named: "buttonBackgroundColor") // 1
        configuration.baseForegroundColor = UIColor(named: "buttonTextColor")
        configuration.background.cornerRadius = 20
        configuration.title = "Регистрация"
        let button = UIButton(configuration: configuration, primaryAction: nil)
        return button
    }()
    
    @objc func enterEmailFieldDidBeginEditing() {
        if enterEmailField.text != nil {
            enterEmailField.text = ""
        }
    }
    @objc func enterPasswordFieldDidBeginEditing() {
        if enterPasswordField.text != nil {
            enterPasswordField.text = ""
        }
    }
    @objc func reenterPasswordFieldDidBeginEditing() {
        if reenterPasswordField.text != nil {
            reenterPasswordField.text = ""
        }
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        enterEmailField.addTarget(self, action: #selector(enterEmailFieldDidBeginEditing), for: .editingDidBegin)
        enterPasswordField.addTarget(self, action: #selector(enterPasswordFieldDidBeginEditing), for: .editingDidBegin)
        reenterPasswordField.addTarget(self, action: #selector(reenterPasswordFieldDidBeginEditing), for: .editingDidBegin)
        addSubview(registrationViewTitle)
        addSubview(enterEmailField)
        addSubview(enterPasswordField)
        addSubview(reenterPasswordField)
        addSubview(registrationButton)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        registrationViewTitle.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.centerX.equalToSuperview()
        }
        
        enterEmailField.snp.makeConstraints { make in
            make.top.equalTo(registrationViewTitle.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(40)
        }
        enterPasswordField.snp.makeConstraints { make in
            make.top.equalTo(enterEmailField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(40)
        }
        reenterPasswordField.snp.makeConstraints { make in
            make.top.equalTo(enterPasswordField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(40)
        }
        registrationButton.snp.makeConstraints { make in
            make.top.equalTo(reenterPasswordField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(40)
        }
    }
}
