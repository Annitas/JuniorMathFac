//
//  RoomModel.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 10.04.2024.
//
import Foundation

struct RoomModel: Codable {
    let id: Int
    let code: Int
    let name: String
    let class_number: Int
    let profile_room: Int
    let room_task: Int
    let created_at: Date
    let started_at: Date
}
