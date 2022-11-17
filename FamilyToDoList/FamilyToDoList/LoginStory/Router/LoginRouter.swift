//
//  LoginRouter.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 6/26/22.
//

import Foundation

class LoginRouter {

    var view: LoginViewType!
}

// MARK: LoginRouterType
extension LoginRouter: LoginRouterType {
    
    func showListVC(with userData: User) {
        let listViewController = ListInitializer.initializeModule(with: userData).viewController
        view.viewController.navigationController?.pushViewController(listViewController, animated: true)
    }
}
