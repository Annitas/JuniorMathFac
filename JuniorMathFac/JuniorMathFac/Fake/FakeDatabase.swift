//
//  FakeDatabase.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 10.04.2024.
//

import Foundation

final class FakeDatabase {
    let childrenArray: [StudentModel] = [StudentModel(id: 0,
                                                      lastName: "Сысоева",
                                                      firstName: "Надежда",
                                                      patronymic: "Викторовна",
                                                      login: "Alistar",
                                                      hashedPassword: "wddwd", isAdmin: false),
                                         StudentModel(id: 1, lastName: "Грибова",
                                                      firstName: "Нина",
                                                      patronymic: "Олеговна",
                                                      login: "Ninchick",
                                                      hashedPassword: "wddwd", isAdmin: false),
                                         StudentModel(id: 2,
                                                      lastName: "Минаева",
                                                      firstName: "Кира",
                                                      patronymic: "Викторовна",
                                                      login: "Alistar",
                                                      hashedPassword: "wddwd", isAdmin: false),
                                         StudentModel(id: 3,
                                                      lastName: "Надеждин",
                                                      firstName: "Надежда",
                                                      patronymic: "Викторовна",
                                                      login: "Alistar",
                                                      hashedPassword: "wddwd", isAdmin: false),
                                         StudentModel(id: 4,
                                                      lastName: "Малютин",
                                                      firstName: "Андрей",
                                                      patronymic: "Георгиевич",
                                                      login: "Alistar",
                                                      hashedPassword: "wddwd", isAdmin: false),
                                         StudentModel(id: 5,
                                                      lastName: "Вихров",
                                                      firstName: "Дмитрий",
                                                      patronymic: "Иванович",
                                                      login: "Alistar",
                                                      hashedPassword: "wddwd", isAdmin: false)]

    let tasksArray: [TaskModel] = [TaskModel(condition: "Вычислите, впишите ответ. Если его можно выразить в виде десятичной дроби, то знаки разделяйте точкой, например: 5.4 Если нельзя, то в виде неправильной дроби", answer: "4"),
                                   TaskModel(condition: "How many ears does the rabbit have", answer: "2"),
                                   TaskModel(condition: "How old is ten years old child", answer: "10"),
                                   TaskModel(condition: "Name of the bunny", answer: "Kenny"),
                                   TaskModel(condition: "6+4*2", answer: "14"),
                                   TaskModel(condition: "9*0", answer: "0"),
                                   TaskModel(condition: "Drink?", answer: "No"),]

}
