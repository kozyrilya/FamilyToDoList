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

//        guard let storageService = ServiceFactory.makeService(for: .storage) as? StorageServiceType else {
//            fatalError("service should exist")
//        }
//
//        guard let notificationService = ServiceFactory.makeService(for: .notification) as? NotificationService else {
//            fatalError("service should exist")
//        }

        let interactor = LoginInteractor()

        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor

        return view
    }
}
