//
//  ValidationManager.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 11/1/22.
//

import Foundation

protocol ValidationManagerType: ManagerType {
    func validateEmail(with email: String?) -> CommonError?
    func validatePassword(with password: String?) -> CommonError?
}

enum TextFieldsTypes {
    case email
    case password
}

enum CommonError: Error {
    case atSymbol
    case emptyEmail
    case minCharactersCount
    case emptyPassword
    case incorrectPassword

    var description: String {
        switch self {
        case .atSymbol:
            return CommonErrors.commonErrorText + CommonErrors.invalidEmailErrorText
        case .emptyEmail:
            return CommonErrors.commonErrorText + CommonErrors.emptyEmailErrorText
        case .minCharactersCount:
            return CommonErrors.commonErrorText + CommonErrors.invalidPasswordErrorText
        case .emptyPassword:
            return CommonErrors.commonErrorText + CommonErrors.emptyPasswordErrorText
        case .incorrectPassword:
            return CommonErrors.commonErrorText + CommonErrors.incorrectPasswordErrorText
        }
    }
}

class ValidationManager { }

// MARK: ValidationManagerType
extension ValidationManager: ValidationManagerType {

    func validateEmail(with email: String?) -> CommonError? {
        guard let email = email, email.trimmingCharacters(in: .whitespaces).count > 0 else {
            return CommonError.emptyEmail
        }

        if !email.contains("@") {
            return CommonError.atSymbol
        }

        return nil
    }

    func validatePassword(with password: String?) -> CommonError? {
        guard let password = password, password.count > 0 else {
            return CommonError.emptyPassword
        }

        if password.count < 6 {
            return CommonError.minCharactersCount
        }

        return nil
    }
}
