//
//  ViewType.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 7/19/22.
//

import UIKit

protocol ViewType: AnyObject {

    var viewController: UIViewController { get }
}

extension ViewType where Self: UIViewController {

    var viewController: UIViewController {
        return self
    }
}

extension ViewType {
    func showError(_ error: Error) {
        let alertController = UIAlertController(title: "Error",
                                                message: error.localizedDescription,
                                                preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: "OK",
                                                style: .default,
                                                handler: nil))

        viewController.present(alertController, animated: true)
    }

    func hideError() {
        if viewController.presentedViewController is UIAlertController {
            viewController.dismiss(animated: true)
        }
    }
}
