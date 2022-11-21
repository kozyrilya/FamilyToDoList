//
//  CommonLoginButton.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 10/30/22.
//

import UIKit

class CommonLoginButton: UIButton {

    enum ButtonState {
        case signIn
        case signUp

        var title: String {
            switch self {
            case .signIn:
                return LoginLocalizedStrings.Button.signInButtonText
            case .signUp:
                return LoginLocalizedStrings.Button.signUpButtonText
            }
        }
    }

    var buttonState: ButtonState!

    required init(buttonState: ButtonState) {
        self.buttonState = buttonState
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        self.backgroundColor = .black
        self.setTitle(buttonState.title, for: .normal)
    }

    func reloadButton(buttonState: ButtonState) {
        self.buttonState = buttonState
        self.setTitle(buttonState.title, for: .normal)
    }
}
