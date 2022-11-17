//
//  UIViewController+Extension.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 11/17/22.
//

import UIKit

extension UIStoryboard {
    func instantiateConcreteViewController<T>(identifier: String = String(describing: T.self)) -> T where T: UIViewController {
        guard let viewController = instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("Developer error. Not Found view controller ")
        }
        return viewController
    }
}
