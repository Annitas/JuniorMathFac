//
//  StudentModel.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 9.04.2024.
//

struct StudentModel: Codable {
    var id: Int = 0
    let lastName: String
    let firstName: String
    var patronymic: String = ""
    var login: String = ""
    let hashedPassword: String
    var isAdmin: Bool = false
}
