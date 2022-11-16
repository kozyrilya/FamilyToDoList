//
//  LoginViewProtocol.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 6/26/22.
//

import Foundation

protocol LoginViewType: ViewType {

}

protocol LoginViewOutput {
    func signIn(email: String?, password: String?)
    func signUp(email: String?, password: String?)
}
