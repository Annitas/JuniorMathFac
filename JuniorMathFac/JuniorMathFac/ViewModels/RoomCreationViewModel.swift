//
//  RoomCreationViewModel.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 26.05.2024.
//

import Foundation

final class RoomCreationViewModel {
    static func getStudentsFromDataBase() -> [StudentModel] {
        let db = FakeDatabase()
        return db.childrenArray
    }
    
    static func getTasksFromDataBase() -> [TaskModel] {
        let db = FakeDatabase()
        return db.tasksArray
    }
    
    static func getAvailableRoomsFromDataBase() -> [RoomModel] {
        let db = FakeDatabase()
        return db.roomsArray
    }
    
    static func addRoomToDatabase(room: RoomModel) {
        let db = FakeDatabase()
        db.roomsArray.append(room)
    }
}
