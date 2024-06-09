//
//  FakeDatabase.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 10.04.2024.
//

import Foundation

final class FakeDatabase {
    static let shared = FakeDatabase()
    
    private init() {}
    
    let childrenArray: [StudentModel] = [
        StudentModel(id: 0, lastName: "Сысоева", firstName: "Надежда", patronymic: "Викторовна", login: "Alistar", hashedPassword: "wddwd", isAdmin: false),
        StudentModel(id: 1, lastName: "Грибова", firstName: "Нина", patronymic: "Олеговна", login: "Ninchick", hashedPassword: "wddwd", isAdmin: false),
        StudentModel(id: 2, lastName: "Минаева", firstName: "Кира", patronymic: "Викторовна", login: "Alistar", hashedPassword: "wddwd", isAdmin: false),
        StudentModel(id: 3, lastName: "Надеждин", firstName: "Надежда", patronymic: "Викторовна", login: "Alistar", hashedPassword: "wddwd", isAdmin: false),
        StudentModel(id: 4, lastName: "Малютин", firstName: "Андрей", patronymic: "Георгиевич", login: "Alistar", hashedPassword: "wddwd", isAdmin: false),
        StudentModel(id: 5, lastName: "Вихров", firstName: "Дмитрий", patronymic: "Иванович", login: "Alistar", hashedPassword: "wddwd", isAdmin: false)
    ]
    
    let tasksArray: [TaskModel] = [
        TaskModel(id: 0, title: "Задача о дробях", condition: "Вычислите, впишите ответ. Если его можно выразить в виде десятичной дроби, то знаки разделяйте точкой, например: 5.4 Если нельзя, то в виде неправильной дроби", answer: "4"),
        TaskModel(id: 1, title: "Задача об ушках", condition: "How many ears does the rabbit have", answer: "2"),
        TaskModel(id: 2, title: "Задача о возрасте", condition: "How old is ten years old child", answer: "10"),
        TaskModel(id: 3, title: "Как зовут зайку", condition: "Name of the bunny", answer: "Kenny"),
        TaskModel(id: 4, title: "Вычислить", condition: "6+4*2", answer: "14"),
        TaskModel(id: 5, title: "Посчитать", condition: "9*0", answer: "0"),
        TaskModel(id: 6, title: "Сложный вопрос", condition: "Drink?", answer: "No")
    ]
    
    var roomsArray: [RoomModel] = []
}
