//
//  CoreDataManager.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 7/19/22.
//

import Foundation
import CoreData

class CoreDataService {

    init() {
        initalizeStack()
    }

    private var modelName = "CDLibraryItem"
    private let persistentContainer = NSPersistentContainer(name: "database")
    private var context: NSManagedObjectContext { return self.persistentContainer.viewContext }

    func initalizeStack() {
        self.persistentContainer.loadPersistentStores { description, error in

            if let error = error {
                print("Сould not load store \(error.localizedDescription)")
                return
            }
        }
    }
}
