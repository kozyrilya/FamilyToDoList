//
//  ValidationManager.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 11/1/22.
//

import Foundation

class ValidationManager {

    enum TextFieldsTypes {
        case email
        case password
    }

    enum EmailValidationErrors {
        case atSymbol
        case emptyEmail

        var description: String {
            switch self {
            case .atSymbol:
                return errorTitle + CommonErrors.invalidEmailErrorText
            case .emptyEmail:
                return errorTitle + CommonErrors.emptyEmailErrorText
            }
        }
    }

    enum PasswordValidationErrors {
        case minCharactersCount
        case emptyPassword
        case incorrectPassword

        var description: String {
            switch self {
            case .minCharactersCount:
                return errorTitle + CommonErrors.invalidPasswordErrorText
            case .emptyPassword:
                return errorTitle + CommonErrors.emptyPasswordErrorText
            case .incorrectPassword:
                return errorTitle + CommonErrors.incorrectPasswordErrorText
            }
        }
    }

    static var shared: ValidationManager = ValidationManager()

    private static var errorTitle: String = CommonErrors.commonErrorText

    private init() { }

    func checkIsEmpty(with text: String, fieldType: TextFieldsTypes) -> String? {
        if text.isEmpty == true {
            switch fieldType {
            case .email:
                return EmailValidationErrors.emptyEmail.description
            case .password:
                return PasswordValidationErrors.emptyPassword.description
            }
        }

        return nil
    }

    func validateEmail(with email: String) -> String? {
        let trimmedEmail = email.trimmingCharacters(in: .whitespaces)

        if trimmedEmail.count == 0 {
            return EmailValidationErrors.emptyEmail.description
        }

        if !trimmedEmail.contains("@") {
            return EmailValidationErrors.atSymbol.description
        }

        return nil
    }

    func validatePassword(with password: String) -> String? {
        if password.count == 0 {
            return PasswordValidationErrors.emptyPassword.description
        }

        if password.count < 6 {
            return PasswordValidationErrors.minCharactersCount.description
        }

        return nil
    }
}
