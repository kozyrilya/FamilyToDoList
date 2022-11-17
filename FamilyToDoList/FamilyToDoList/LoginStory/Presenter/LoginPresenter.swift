//
//  LoginPresenter.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 6/26/22.
//

import Foundation

class LoginPresenter {

    weak var view: LoginViewType?
    var interactor: LoginInteractorType?
    var router: LoginRouterType!
}

// MARK: LoginViewOutput
extension LoginPresenter: LoginViewOutput {
    
    func signIn(email: String?, password: String?) {
        interactor?.signIn(email: email, password: password, completion: { result in
            switch result {
            case .success(let userData):
                self.router.showListVC(with: userData)
            case .failure(let error):
                self.view?.showError(error)
            }
        })
    }

    func signUp(email: String?, password: String?) {
        interactor?.signUp(email: email, password: password, completion: { result in
            switch result {
            case .success(let userData):
                self.router.showListVC(with: userData)
            case .failure(let error):
                self.view?.showError(error)
            }
        })
    }
}
