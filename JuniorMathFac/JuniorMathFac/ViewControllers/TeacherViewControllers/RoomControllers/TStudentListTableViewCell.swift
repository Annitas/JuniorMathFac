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
    
    let nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
}
