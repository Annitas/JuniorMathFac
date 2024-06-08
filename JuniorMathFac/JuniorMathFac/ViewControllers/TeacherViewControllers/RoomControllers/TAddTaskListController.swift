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
    }
}

extension TAddTaskListController: UITableViewDelegate {
    
}

extension TAddTaskListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TTasksTableViewCell.self), for: indexPath) as! TTasksTableViewCell
        cell.viewModel = viewModel[indexPath.row]
        return cell
    }
    
}
