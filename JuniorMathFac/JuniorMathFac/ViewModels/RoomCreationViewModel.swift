//
//  RoomCreationViewModel.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 26.05.2024.
//

import Foundation

final class RoomCreationViewModel {
    static func getStudentsFromDataBase() -> [StudentModel] {
        return FakeDatabase.shared.childrenArray
    }
    
    static func getTasksFromDataBase() -> [TaskModel] {
        return FakeDatabase.shared.tasksArray
    }
    
    static func getAvailableRoomsFromDataBase() -> [RoomModel] {
        return FakeDatabase.shared.roomsArray
    }
    
    static func addRoomToDatabase(room: RoomModel) {
        FakeDatabase.shared.roomsArray.append(room)
    }
}
