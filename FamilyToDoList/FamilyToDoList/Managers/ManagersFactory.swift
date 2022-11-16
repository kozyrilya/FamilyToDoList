//
//  ManagersFactory.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 11/16/22.
//

import Foundation

protocol ManagerType {}

enum ManagersFactory {

    static func makeManager(for type: Manager) -> ManagerType {
        switch type {
        case .validation:
            return ValidationManager()
        case .storage:
            return CoreDataManager()
        }
    }
}
extension ManagersFactory {

    enum Manager {
        case validation
        case storage
    }
}
