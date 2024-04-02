//
//  TTasksViewController.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 02.04.2024.
//

import Foundation
import UIKit
import SnapKit

final class TTasksViewController: UIViewController {
    private let backGroundImage: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.image = UIImage(named: "backgroundImage")
        return iv
    }()
    
    private let tasksListLabel = CustomHeaderTitle(title: "Задачи")
    
    private let searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Поиск задачи"
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(backGroundImage)
        view.addSubview(tasksListLabel)
        view.addSubview(searchTextField)
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
        
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(tasksListLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
    }
}
