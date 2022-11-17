//
//  ListPresenter.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 11/16/22.
//

import Foundation

class ListPresenter {

    weak var view: ListViewType?
    var interactor: ListInteractorType?
    var router: ListRouterType!
}

// MARK: ListViewOutput
extension ListPresenter: ListViewOutput {

    func addNewNote() {
        router.showAddNewNoteVC()
    }
}
