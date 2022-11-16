//
//  LocalizedCommonStringsConstants.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 10/30/22.
//

import Foundation

enum CommonConstants {
    static let signInButtonText = NSLocalizedString(
           "SignInButtonText",
           value: "Sign In",
           comment: "Text for Sign In button"
    )

    static let signUpButtonText = NSLocalizedString(
           "SignUpButtonText",
           value: "Sign Up",
           comment: "Text for Sign Up button"
    )

    static let loginTextFieldPlaceholder = NSLocalizedString(
           "loginTextFieldPlaceholder",
           value: "Enter your email",
           comment: "Placeholder for login text field"
    )

    static let passwordTextFieldPlaceholder = NSLocalizedString(
           "passwordTextFieldPlaceholder",
           value: "Enter your password",
           comment: "Placeholder for password text field"
    )

    static let loginViewSignUpDescriptionLabelText = NSLocalizedString(
           "loginViewSignUpDescriptionLabelText",
           value: "Don't have an account?",
           comment: "Text for description label in Sign In state"
    )

    static let loginViewSignInDescriptionLabelText = NSLocalizedString(
           "loginViewSignInDescriptionLabelText",
           value: "Have an account?",
           comment: "Text for description label in Sign Up state"
    )
}

enum CommonErrors {
    static let commonErrorText = NSLocalizedString(
           "commonErrorText",
           value: "Error: ",
           comment: "Common error text"
    )

    static let invalidEmailErrorText = NSLocalizedString(
           "invalidEmailErrorText",
           value: "Must contain @.",
           comment: "Invalid email"
    )

    static let emptyEmailErrorText = NSLocalizedString(
           "emptyEmailErrorText",
           value: "Please enter a valid email.",
           comment: "Emtpy email"
    )

    static let invalidPasswordErrorText = NSLocalizedString(
           "invalidPasswordErrorText",
           value: "Minimum 6 symbols.",
           comment: "Invalid password characters count"
    )

    static let emptyPasswordErrorText = NSLocalizedString(
           "emptyPasswordErrorText",
           value: "Please enter valid password.",
           comment: "Emtpy password"
    )

    static let incorrectPasswordErrorText = NSLocalizedString(
           "incorrectPasswordErrorText",
           value: "Incorrect password.",
           comment: "Incorrect password"
    )
}
