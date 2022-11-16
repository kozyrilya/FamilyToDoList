//
//  LoginInteractorProtocol.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 7/19/22.
//

import Foundation

protocol LoginInteractorType {
    func signIn(email: String?, password: String?, completion: @escaping (Result<User, CommonError>) -> Void)
    func signUp(email: String?, password: String?, completion: @escaping (Result<User, CommonError>) -> Void)
}
