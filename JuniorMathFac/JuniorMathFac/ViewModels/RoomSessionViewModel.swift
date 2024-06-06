//
//  RoomSessionViewModel.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 06.06.2024.
//

import Foundation

final class RoomSessionViewModel {
    struct Output {
        var tasks: [TaskModel] = [] //
    }
    struct Input {
        var answerButtonSelected: ((String) -> ())?
    }
    var output: Output = .init() {
        didSet {
            outputChanged?()
        }
    }
    var input: Input = .init()
    var outputChanged: (() -> ())?
    
    init(output: Output = .init(),
         outputChanged: (() -> Void)? = nil) {
        self.output = output
        self.outputChanged = outputChanged
        
        input.answerButtonSelected = { str in
            
        }
        
    }
    
    func startSession() {
        
    }
}
