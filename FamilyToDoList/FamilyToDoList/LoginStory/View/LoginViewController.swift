//
//  LoginViewController.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 7/19/22.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController {

    var presenter: LoginViewOutput?

    private lazy var textFieldsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()

    private lazy var loginTextField: CommonUITextField = {
        let textField = CommonUITextField(type: .login)
        return textField
    }()

    private lazy var passwordTextField: CommonUITextField = {
        let textField = CommonUITextField(type: .password)
        return textField
    }()

    private lazy var loginButton: CommonLoginButton = {
        let button = CommonLoginButton(buttonState: .signIn)
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return button
    }()

    private lazy var loginView: CommonLoginTypeView = .fromNib()

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        setupLayout()
        setupUI()
    }

    // MARK: UI Methods
    private func setupUI() {
        loginView.configure(delegate: self)
    }

    private func setupLayout() {
        setupStackViewConstraints()
        setupTextFieldsConstraints()
        setupLoginButtonConstraints()
        setupLoginViewConstraints()
    }

    private func setupStackViewConstraints() {
        self.view.addSubview(textFieldsStackView)
        textFieldsStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.left.right.equalToSuperview().inset(16)
        }
    }

    private func setupTextFieldsConstraints() {
        textFieldsStackView.addArrangedSubview(loginTextField)
        loginTextField.snp.makeConstraints {
            $0.height.equalTo(50)
        }

        textFieldsStackView.addArrangedSubview(passwordTextField)
        passwordTextField.snp.makeConstraints {
            $0.height.equalTo(50)
        }
    }

    private func setupLoginButtonConstraints() {
        self.view.addSubview(loginButton)
        loginButton.snp.makeConstraints {
            $0.top.equalTo(textFieldsStackView.snp.bottom).offset(100)
            $0.height.equalTo(50)
            $0.width.equalTo(textFieldsStackView.snp.width)
            $0.centerX.equalTo(textFieldsStackView.snp.centerX)
        }
    }

    private func setupLoginViewConstraints() {
        self.view.addSubview(loginView)
        loginView.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(10)
            $0.height.equalTo(50)
            $0.centerX.equalTo(loginButton.snp.centerX)
        }
    }

    @objc private func loginButtonPressed(button: CommonLoginButton) {
        button.buttonState == .signIn ?
        presenter?.signIn(email: loginTextField.text, password: passwordTextField.text) :
        presenter?.signUp(email: loginTextField.text, password: passwordTextField.text)
    }
}

// MARK: LoginViewType
extension LoginViewController: LoginViewType { }

// MARK: CommonLoginViewDelegate
extension LoginViewController: CommonLoginTypeViewDelegate {
    func changeLoginTypeButtonPressed(with state: CommonLoginTypeView.LoginState) {
        state == .signIn ? loginButton.reloadButton(buttonState: .signIn) : loginButton.reloadButton(buttonState: .signUp)
    }
}
