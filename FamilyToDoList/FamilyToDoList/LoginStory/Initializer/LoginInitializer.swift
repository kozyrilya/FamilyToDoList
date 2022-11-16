//
//  LoginInitializer.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 7/19/22.
//

import Foundation

class LoginInitializer {

    static func initializeModule() -> ViewType {
        let view = LoginViewController()
        let router = LoginRouter()
        router.view = view

        let presenter = LoginPresenter()
        view.presenter = presenter

        guard let validationManager = ManagersFactory.makeManager(for: .validation) as? ValidationManagerType else {
            fatalError("manager should exist")
        }

        guard let coreDataManager = ManagersFactory.makeManager(for: .storage) as? CoreDataManagerType else {
            fatalError("manager should exist")
        }

        let interactor = LoginInteractor(with: validationManager, coreDataManager: coreDataManager)

        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor

        return view
    }
}
