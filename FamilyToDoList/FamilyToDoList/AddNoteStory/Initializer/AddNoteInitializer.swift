//
//  AddNoteInitializer.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 11/17/22.
//

import Foundation

class AddNoteInitializer {

    static func initializeModule() -> ViewType {
        let view = AddNoteViewController()
        let router = AddNoteRouter()
        router.view = view

        let presenter = AddNotePresenter()
        view.presenter = presenter

        guard let coreDataManager = ManagersFactory.makeManager(for: .storage) as? CoreDataManagerType else {
            fatalError("manager should exist")
        }

        let interactor = AddNoteInteractor(coreDataManager: coreDataManager)

        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor

        return view
    }
}
