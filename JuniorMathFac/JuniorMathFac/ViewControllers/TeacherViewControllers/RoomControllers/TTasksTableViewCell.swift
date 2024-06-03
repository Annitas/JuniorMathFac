//
//  TTasksTableViewCell.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 03.06.2024.
//

import UIKit

final class TTasksTableViewCell: UITableViewCell {
    var viewModel: TaskModel = TaskModel(condition: "", answer: "") {
        didSet {
            conditionLabel.text = viewModel.condition
        }
    }
    
    let externalView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    let innerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.darkGray.cgColor
        return view
    }()
    
    let conditionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(externalView)
        externalView.addSubview(innerView)
        innerView.addSubview(conditionLabel)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        externalView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalToSuperview()
            make.right.equalToSuperview().offset(-10)
            make.left.equalToSuperview().offset(10)
            make.bottom.equalToSuperview()
        }
        
        innerView.snp.makeConstraints { make in
            make.height.equalTo(45)
            make.top.equalToSuperview().offset(5)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        conditionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview()
        }
    }
}
