//
//  ListRouter.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 11/16/22.
//

import Foundation

class ListRouter {

    var view: ListViewType!
}

extension ListRouter: ListRouterType {

    func showAddNewNoteVC() {
        let addNewNoteViewController = AddNoteInitializer.initializeModule().viewController
        view.viewController.navigationController?.pushViewController(addNewNoteViewController, animated: true)
    }
}
