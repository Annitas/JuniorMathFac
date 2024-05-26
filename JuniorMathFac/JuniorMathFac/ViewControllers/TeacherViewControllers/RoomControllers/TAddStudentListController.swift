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
    
    
    var viewModel: [StudentModel] = RoomCreationViewModel.getStudentsFromDataBase() {
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
    }
}

extension TAddStudentListController: UITableViewDelegate {
    
}

extension TAddStudentListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TStudentListTableViewCell.self), for: indexPath) as! TStudentListTableViewCell
        cell.viewModel = viewModel[indexPath.row]
        return cell
    }
    
}
