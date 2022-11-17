//
//  AddNoteInteractor.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 11/17/22.
//

import Foundation

class AddNoteInteractor {

    let coreDateManager: CoreDataManagerType!

    init(coreDataManager: CoreDataManagerType) {
        self.coreDateManager = coreDataManager
    }
}

// MARK: AddNoteInteractorType
extension AddNoteInteractor: AddNoteInteractorType {

    func addNewNote() {
        print("Note Added")
    }
}
