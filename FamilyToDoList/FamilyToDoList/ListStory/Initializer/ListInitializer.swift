//
//  ListInitializer.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 11/16/22.
//

import UIKit

class ListInitializer {

    static func initializeModule(with userData: User) -> ViewType {
        let storyboard = UIStoryboard(name: "ListStoryboard", bundle: nil)
        let view: ListViewController = storyboard.instantiateConcreteViewController()
        let router = ListRouter()
        router.view = view

        let presenter = ListPresenter()
        view.presenter = presenter

        guard let coreDataManager = ManagersFactory.makeManager(for: .storage) as? CoreDataManagerType else {
            fatalError("manager should exist")
        }

        let interactor = ListInteractor(coreDataManager: coreDataManager, userData: userData)

        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor

        return view
    }
}
