//
//  AddNotePresenter.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 11/17/22.
//

import Foundation

class AddNotePresenter {

    weak var view: AddNoteViewType?
    var interactor: AddNoteInteractorType?
    var router: AddNoteRouterType!
}

// MARK: AddNoteViewOutput
extension AddNotePresenter: AddNoteViewOutput {
    
    func addNewNote() {
        interactor?.addNewNote()
    }
}
