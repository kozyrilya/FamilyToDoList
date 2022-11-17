//
//  ListInteractor.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 11/16/22.
//

import Foundation

class ListInteractor {

    let coreDateManager: CoreDataManagerType!
    private let userData: User!

    init(coreDataManager: CoreDataManagerType, userData: User) {
        self.coreDateManager = coreDataManager
        self.userData = userData
        print(userData)
    }
}

// MARK: ListInteractorType
extension ListInteractor: ListInteractorType {
}
