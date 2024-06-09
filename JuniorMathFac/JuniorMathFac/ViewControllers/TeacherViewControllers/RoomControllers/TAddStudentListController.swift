//
//  TStudentListController.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 12.05.2024.
//

import UIKit
import SnapKit

final class TAddStudentListController: UIViewController {
    let tableView: UITableView = .init()
    private let chooseButton = CustomButton(title: "Выбрать")
    
    var viewModel: [StudentModel] = RoomCreationViewModel.getStudentsFromDataBase() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var selectedStudents: [StudentModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(tableView)
        view.addSubview(chooseButton)
        tableView.backgroundColor = UIColor.white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.estimatedRowHeight = 50
        tableView.register(TStudentListTableViewCell.self,
                           forCellReuseIdentifier: String(describing: TStudentListTableViewCell.self))
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        chooseButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
        
        chooseButton.addTarget(self, action: #selector(chooseButtonTapped), for: .touchUpInside)
    }
    
    @objc private func chooseButtonTapped() {
        print("Selected students: \(selectedStudents)")
    }
}

extension TAddStudentListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedStudent = viewModel[indexPath.row]
        if let index = selectedStudents.firstIndex(where: { $0.id == selectedStudent.id }) {
            selectedStudents.remove(at: index)
        } else {
            selectedStudents.append(selectedStudent)
        }
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

extension TAddStudentListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TStudentListTableViewCell.self), for: indexPath) as! TStudentListTableViewCell
        cell.viewModel = viewModel[indexPath.row]
        
        if selectedStudents.contains(where: { $0.id == viewModel[indexPath.row].id }) {
            cell.backgroundColor = UIColor.lightGray
        } else {
            cell.backgroundColor = UIColor.white
        }
        
        return cell
    }
}
