//
//  ListViewController.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 11/16/22.
//

import UIKit

final class ListViewController: UIViewController {

    var presenter: ListViewOutput?
    private var dataSource = ListDataSource()

    @IBOutlet private var listTableView: UITableView!

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: UI Methods
    private func setupUI() {
        dataSource.bind(tableView: listTableView)
        setupNavigationBar()
    }

    private func setupNavigationBar() {
        let addBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonAction))
        addBarButtonItem.tintColor = .black
        self.navigationItem.rightBarButtonItem = addBarButtonItem
    }

    @objc private func addButtonAction(sender: UIBarButtonItem) {
        presenter?.addNewNote()
    }
}

// MARK: ListViewType
extension ListViewController: ListViewType { }
