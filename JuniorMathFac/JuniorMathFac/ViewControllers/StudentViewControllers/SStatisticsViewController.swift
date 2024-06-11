//
//  SStatisticsViewController.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 10.06.2024.
//

import UIKit
import SnapKit

final class SStatisticsViewController: UIViewController {
    static var answer: [Bool] = []
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(resultLabel)
        resultLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        updateResultLabel()
    }
    
    private func updateResultLabel() {
        if SStatisticsViewController.answer.isEmpty {
            resultLabel.text = "Работа не пройдена"
        } else {
            let correctAnswers = SStatisticsViewController.answer.filter { $0 }.count
            let totalAnswers = SStatisticsViewController.answer.count
            let percentage = (Double(correctAnswers) / Double(totalAnswers)) * 100
            resultLabel.text = String(format: "Процент правильных ответов: %.2f%%", percentage)
        }
    }
}
