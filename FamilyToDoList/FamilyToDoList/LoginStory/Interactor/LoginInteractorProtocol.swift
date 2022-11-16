//
//  LoginInteractorProtocol.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 7/19/22.
//

import Foundation

enum Block {
    typealias Empty = () -> Void
}

protocol LoginInteractorType {
    func signIn(email: String?, password: String?, completion: @escaping (Result<Bool, Error>) -> Void)
    func signUp(email: String?, password: String?, completion: @escaping (Result<Bool, Error>) -> Void)
}
