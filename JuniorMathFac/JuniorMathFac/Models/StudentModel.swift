//
//  StudentModel.swift
//  JuniorMathFac
//
//  Created by Anita Stashevskaya on 9.04.2024.
//

struct StudentModel: Codable {
    let id: Int
    let lastName: String
    let firstName: String
    let patronymic: String
    let login: String
    let hashedPassword: String
    let isAdmin: Bool
}
