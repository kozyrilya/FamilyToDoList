//
//  ListViewProtocol.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 11/16/22.
//

import Foundation

protocol ListViewType: ViewType { }

protocol ListViewOutput {
    func addNewNote()
}
