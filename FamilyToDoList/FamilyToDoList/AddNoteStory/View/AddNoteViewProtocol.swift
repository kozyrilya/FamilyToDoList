//
//  AddNoteViewProtocol.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 11/17/22.
//

import Foundation

protocol AddNoteViewType: ViewType { }

protocol AddNoteViewOutput {
    func addNewNote()
}
