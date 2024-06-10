//
//  ChooseSTProfile.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 10.06.2024.
//

import UIKit
import SnapKit

final class ChooseSTProfile: UIViewController {
    private let teacherRoomButton = CustomButton(title: "Teacher")
    private let studentRoomButton = CustomButton(title: "Student")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(teacherRoomButton)
        view.addSubview(studentRoomButton)
        view.backgroundColor = .systemBackground
        setupView()
    }
    
    private func setupView() {
        teacherRoomButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(200)
        }
        teacherRoomButton.addTarget(self, action: #selector(teacherOpen), for: .touchUpInside)
        studentRoomButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(teacherRoomButton.snp.bottom).offset(40)
        }
        studentRoomButton.addTarget(self, action: #selector(studentOpen), for: .touchUpInside)
    }
    
    @objc func teacherOpen() {
        navigationController?.pushViewController(TMainScreenViewController(), animated: true)
    }
    
    @objc func studentOpen() {
        navigationController?.pushViewController(SMainScreenViewController(), animated: true)
    }
}
