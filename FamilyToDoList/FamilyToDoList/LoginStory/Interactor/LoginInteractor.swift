//
//  LoginInteractor.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 6/26/22.
//

import Foundation

class LoginInteractor {

    let validationManager: ValidationManagerType!
    let coreDateManager:CoreDataManagerType!

    init(with validationManager: ValidationManagerType, coreDataManager: CoreDataManagerType) {
        self.validationManager = validationManager
        self.coreDateManager = coreDataManager
    }
}

// MARK: LoginInteractorType
extension LoginInteractor: LoginInteractorType {
    
    func signIn(email: String?, password: String?, completion: @escaping (Result<User, CommonError>) -> Void) {
        let emailValidationError = validationManager.validateEmail(with: email)
        if let emailValidationError = emailValidationError {
            completion(.failure(emailValidationError))
        }

        let passwordValidationError = validationManager.validatePassword(with: password)
        if let passwordValidationError = passwordValidationError {
            completion(.failure(passwordValidationError))
        }
    }

    func signUp(email: String?, password: String?, completion: @escaping (Result<User, CommonError>) -> Void) {
        let emailValidationError = validationManager.validateEmail(with: email)
        if let emailValidationError = emailValidationError {
            completion(.failure(emailValidationError))
        }

        let passwordValidationError = validationManager.validatePassword(with: password)
        if let passwordValidationError = passwordValidationError {
            completion(.failure(passwordValidationError))
        }
    }
}
