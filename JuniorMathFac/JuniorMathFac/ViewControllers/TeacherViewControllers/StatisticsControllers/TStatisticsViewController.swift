//
//  TStatistics.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 02.04.2024.
//

import UIKit
import SnapKit

final class TStatisticsViewController: UIViewController {
    private let backGroundImage: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.image = UIImage(named: "backgroundImage")
        return iv
    }()
    
    private let tasksListLabel = CustomHeaderTitle(title: "Статистика")
    let tableView: UITableView = .init()
    var gameResults: [Bool] = []
    var viewModel: [RoomModel] = RoomCreationViewModel.getAvailableRoomsFromDataBase() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(backGroundImage)
        view.addSubview(tasksListLabel)
        
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
        
        addConstraints()
    }
    
    private func addConstraints() {
        backGroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.40)
        }
        
        tasksListLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
        }
    }
    func updateStatistics(with results: [Bool]) {
        self.gameResults = results
    }
}

extension TStatisticsViewController: UITableViewDelegate {
    
}

extension TStatisticsViewController: UITableViewDataSource {
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
        
        let statisticsVC = SStatisticsViewController()
        navigationController?.pushViewController(statisticsVC, animated: true)
    }
}
