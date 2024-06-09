//
//  RoomModel.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 10.04.2024.
//
import Foundation

struct RoomModel: Codable {
    let roomTitle: String
    var tasks: [TaskModel]
    var students: [StudentModel]
}
