//
//  CommonUITextField.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 7/19/22.
//

import UIKit

class CommonUITextField: UITextField {

    enum TextFieldType {
        case login
        case password

        var title: String {
            switch self {
            case .login:
                return LoginLocalizedStrings.TextField.loginTextFieldPlaceholder
            case .password:
                return LoginLocalizedStrings.TextField.passwordTextFieldPlaceholder
            }
        }
    }

    let type: TextFieldType!

    private var padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)

    required init(type: TextFieldType) {
        self.type = type
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        self.placeholder = type.title
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor

        if type == .password {
            self.isSecureTextEntry = true
            enablePasswordToggle()
        }
    }

    private func setPasswordToggleImage(_ button: UIButton) {
        if isSecureTextEntry {
            button.setImage(UIImage(named: "visible_password_icon"), for: .normal)
        } else {
            button.setImage(UIImage(named: "invisible_password_icon"), for: .normal)
        }
    }

    private func enablePasswordToggle() {
        let button = UIButton(type: .custom)
        setPasswordToggleImage(button)
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = .clear
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        button.configuration = configuration
        button.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        self.rightView = button
        self.rightViewMode = .always
    }

    @objc private func togglePasswordView(sender: UIButton) {
        self.isSecureTextEntry = !self.isSecureTextEntry
        setPasswordToggleImage(sender)
    }
}

// MARK: - Setup Insets
extension CommonUITextField {
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        padding.right = self.rightView?.frame.width ?? 10
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        padding.right = self.rightView?.frame.width ?? 10
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        padding.right = self.rightView?.frame.width ?? 10
        return bounds.inset(by: padding)
    }
}
