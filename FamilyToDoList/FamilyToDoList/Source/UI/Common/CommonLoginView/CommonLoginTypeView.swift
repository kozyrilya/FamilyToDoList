//
//  CommonLoginTypeView.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 10/31/22.
//

import UIKit

protocol CommonLoginTypeViewDelegate: AnyObject {
    func changeLoginTypeButtonPressed(with state: CommonLoginTypeView.LoginState)
}

class CommonLoginTypeView: UIView {

    enum LoginState {
        case signIn
        case signUp

        var descriptionLabelTitle: String {
            switch self {
            case .signIn:
                return CommonConstants.loginViewSignInDescriptionLabelText
            case .signUp:
                return CommonConstants.loginViewSignUpDescriptionLabelText
            }
        }

        var loginButtonTitle: String {
            switch self {
            case .signIn:
                return CommonConstants.signInButtonText
            case .signUp:
                return CommonConstants.signUpButtonText
            }
        }
    }

    private weak var delegate: CommonLoginTypeViewDelegate?

    private var loginState: LoginState = .signUp

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var changeLoginTypeButton: UIButton!

    override class func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func changeLoginTypeButtonAction(_ sender: UIButton) {
        delegate?.changeLoginTypeButtonPressed(with: loginState)

        if loginState == .signUp {
            loginState = .signIn
        } else if loginState == .signIn {
            loginState = .signUp
        }

        reloadView(with: loginState)
    }

    private func reloadView(with state: CommonLoginTypeView.LoginState) {
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        let underlineAttributedString = NSAttributedString(string: loginState.loginButtonTitle, attributes: underlineAttribute)
        changeLoginTypeButton.setAttributedTitle(underlineAttributedString, for: .normal)
        descriptionLabel.text = loginState.descriptionLabelTitle
    }

    func configure(delegate: CommonLoginTypeViewDelegate) {
        self.delegate = delegate
        reloadView(with: loginState)
    }
}
