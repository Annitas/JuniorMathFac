//
//  TStudentListController.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 12.05.2024.
//

import UIKit
import SnapKit

final class TStudentListController: UIViewController {
    let tableView: UITableView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(tableView)
        tableView.backgroundColor = UIColor.lightGray
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TStudentListTableViewCell.self, forCellReuseIdentifier: String(describing: TStudentListTableViewCell.self))
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
    }
}

extension TStudentListController: UITableViewDelegate {
    
}

extension TStudentListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TStudentListTableViewCell.self), for: indexPath) as! TStudentListTableViewCell
        return cell
    }
    
}
