//
//  ViewController.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 20.11.2023.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    let registrationView = TProfileSettingsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(registrationView)
        setupConstraints()
    }

    private func setupConstraints() {
        registrationView.snp.makeConstraints { make in
            make.top.equalToSuperview()        
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
}

