//
//  RoomCreationViewModel.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 26.05.2024.
//

import Foundation

final class RoomCreationViewModel {
    static func getStudentsFromDataBase() -> [StudentModel] {
        let students = FakeDatabase()
        return students.childrenArray
    }
    
    static func getTasksFromDataBase() -> [TaskModel] {
        let tasks = FakeDatabase()
        return tasks.tasksArray
    }
    
    static func getAvailableRoomsFromDataBase() -> [RoomModel] {
        let rooms = FakeDatabase()
        return [RoomModel(roomTitle: "Дроби 8 класс", tasks: rooms.tasksArray, students: rooms.childrenArray)]
    }
}
