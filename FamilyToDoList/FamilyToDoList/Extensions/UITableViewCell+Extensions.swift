//
//  UITableViewCell+Extensions.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 11/21/22.
//

import UIKit

public extension UITableViewCell {

    static func registerNib(for tableView: UITableView, nibName: String, reuseIdentifier: String) {
        tableView.register(UINib(nibName: nibName, bundle: Bundle(for: self)), forCellReuseIdentifier: reuseIdentifier)
    }

    static func dequeue(from tableView: UITableView, with reuseIdentifier: String) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) else {
            fatalError("Unable to dequeue cell with reuse identifier '\(reuseIdentifier)'")
        }
        return cell
    }

    static func dequeue<T: UITableViewCell>(from tableView: UITableView, for indexPath: IndexPath, with reuseIdentifier: String) -> T {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to dequeue cell of type \(T.self) with reuse identifier '\(reuseIdentifier)'")
        }
        return cell
    }
}
