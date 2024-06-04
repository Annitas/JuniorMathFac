//
//  SAvailableRoomsController.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 04.06.2024.
//

import UIKit
import SnapKit

final class SAvailableRoomsController: UIViewController {
    let tableView: UITableView = .init()
    
    
    var viewModel: [RoomModel] = RoomCreationViewModel.getAvailableRoomsFromDataBase() {
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
        tableView.register(SAvailableRoomsTableViewCell.self,
                           forCellReuseIdentifier: String(describing: SAvailableRoomsTableViewCell.self))
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
    }
}

extension SAvailableRoomsController: UITableViewDelegate {
    
}

extension SAvailableRoomsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SAvailableRoomsTableViewCell.self), for: indexPath) as! SAvailableRoomsTableViewCell
        cell.viewModel = viewModel[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SRoomViewController()
        vc.viewModel = viewModel[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
