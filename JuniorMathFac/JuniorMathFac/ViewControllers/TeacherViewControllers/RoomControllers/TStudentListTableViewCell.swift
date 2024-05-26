//
//  TStudentListTableViewCell.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 25.05.2024.
//

import UIKit

public final class TStudentListTableViewCell: UITableViewCell {
    var viewModel: StudentModel = StudentModel(lastName: "", firstName: "", hashedPassword: "") {
        didSet {
            nameLabel.text = viewModel.firstName
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
    
    let nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(externalView)
        externalView.addSubview(innerView)
        innerView.addSubview(nameLabel)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        externalView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        innerView.snp.makeConstraints { make in
            make.height.equalTo(45)
            make.top.equalToSuperview().offset(5)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview()
        }
    }
}
