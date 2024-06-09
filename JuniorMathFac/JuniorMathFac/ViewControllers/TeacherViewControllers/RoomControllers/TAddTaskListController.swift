//
//  TAddTasksListController.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 26.05.2024.
//

import UIKit

final class TAddTaskListController: UIViewController {
    let tableView: UITableView = .init()
    private let chooseButton = CustomButton(title: "Выбрать")
    
    var viewModel: [TaskModel] = RoomCreationViewModel.getTasksFromDataBase() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var selectedTasks: [TaskModel] = []
    
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
        tableView.register(TTasksTableViewCell.self,
                           forCellReuseIdentifier: String(describing: TTasksTableViewCell.self))
        
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
        print("Selected students: \(selectedTasks)")
    }
}

extension TAddTaskListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTask = viewModel[indexPath.row]
        if let index = selectedTasks.firstIndex(where: { $0.id == selectedTask.id }) {
            selectedTasks.remove(at: index)
        } else {
            selectedTasks.append(selectedTask)
        }
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

extension TAddTaskListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TTasksTableViewCell.self), for: indexPath) as! TTasksTableViewCell
        cell.viewModel = viewModel[indexPath.row]
        
        if selectedTasks.contains(where: { $0.id == viewModel[indexPath.row].id }) {
            cell.backgroundColor = UIColor.lightGray
        } else {
            cell.backgroundColor = UIColor.white
        }
        
        return cell
    }
    
}
