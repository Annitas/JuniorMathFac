//
//  TRoomCreationView.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 02.04.2024.
//

import UIKit
import SnapKit

final class TRoomCreationViewController: UIViewController {
    var onRoomCreated: ((RoomModel) -> Void)?
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
    
    private let studentCountLabel: UILabel = {
        let label = UILabel()
        label.text = "учеников"
        label.textColor = .white
        return label
    }()
    
    private let addTasksButton = CustomButton(title: "Добавить задачи")
    private let addStudentsButton = CustomButton(title: "Добавить учеников")
    private let createRoomButton = CustomButton(title: "Создать комнату")
    
    var room = RoomModel(roomTitle: "", tasks: [], students: [])
    
    private let studentsNamesLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        return label
    }()
    
    private let tasksTitlesLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addConstraints()
    }
    
    private func setupView() {
        addStudentsButton.addTarget(self, action: #selector(openStudentList), for: .touchUpInside)
        addTasksButton.addTarget(self, action: #selector(openTasksList), for: .touchUpInside)
        createRoomButton.addTarget(self, action: #selector(createRoom), for: .touchUpInside)
        
        view.backgroundColor = .systemBackground
        view.addSubview(backGroundImage)
        view.addSubview(createRoomHeader)
        view.addSubview(backGroundCardView)
        view.addSubview(studentsNamesLabel)
        view.addSubview(tasksTitlesLabel)
        backGroundCardView.addSubview(roomTitleTextField)
        backGroundCardView.addSubview(studentCountTextField)
        backGroundCardView.addSubview(studentCountLabel)
        view.addSubview(addTasksButton)
        view.addSubview(addStudentsButton)
        view.addSubview(createRoomButton)
        
        addStudentsButton.configuration?.baseBackgroundColor = .white
        addStudentsButton.layer.borderColor = UIColor.blue.cgColor
        addStudentsButton.layer.cornerRadius = 10
        addStudentsButton.layer.borderWidth = 2
        
        addTasksButton.configuration?.baseBackgroundColor = .white
        addTasksButton.layer.borderColor = UIColor.blue.cgColor
        addTasksButton.layer.cornerRadius = 10
        addTasksButton.layer.borderWidth = 2
    }
    
    @objc func openStudentList() {
        let studentListVC = TAddStudentListController()
        studentListVC.onStudentsSelected = { [weak self] selectedStudents in
            self?.room.students = selectedStudents
            self?.studentsNamesLabel.text = self?.room.students.map { "\($0.firstName) \($0.lastName)" }.joined(separator: "\n")
            self?.studentCountTextField.text = "\(selectedStudents.count)"
        }
        navigationController?.pushViewController(studentListVC, animated: true)
    }
    
    @objc func openTasksList() {
        let taskListVC = TAddTaskListController()
        taskListVC.onTasksSelected = { [weak self] selectedTasks in
            self?.room.tasks = selectedTasks
            self?.tasksTitlesLabel.text = self?.room.tasks.map { "\($0.title)" }.joined(separator: "\n")
        }
        navigationController?.pushViewController(taskListVC, animated: true)
    }
    
    @objc func createRoom() {
        if let title = roomTitleTextField.text, !title.isEmpty {
            room.roomTitle = title
            onRoomCreated?(room)
            navigationController?.popViewController(animated: true)
        } else {
            let alert = UIAlertController(title: "Ошибка", message: "Введите название комнаты", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
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
        
        studentsNamesLabel.snp.makeConstraints { make in
            make.top.equalTo(backGroundImage.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
        }
        
        tasksTitlesLabel.snp.makeConstraints { make in
            make.top.equalTo(studentsNamesLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
        }
        
        studentCountTextField.snp.makeConstraints { make in
            make.top.equalTo(roomTitleTextField.snp.bottom).offset(10)
            make.width.equalTo(100)
            make.right.equalTo(roomTitleTextField.snp.right)
        }
        studentCountLabel.snp.makeConstraints { make in
            make.centerY.equalTo(studentCountTextField.snp.centerY)
            make.right.equalTo(studentCountTextField.snp.left).offset(-10)
        }
        addStudentsButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(addTasksButton.snp.top).offset(-20)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
        addTasksButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(createRoomButton.snp.top).offset(-20)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
        createRoomButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
    }
}
