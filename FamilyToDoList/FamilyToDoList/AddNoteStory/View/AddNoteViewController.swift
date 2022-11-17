//
//  AddNoteViewController.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 11/17/22.
//

import UIKit

final class AddNoteViewController: UIViewController {

    var presenter: AddNoteViewOutput?

    private var noteTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .blue
        return textField
    }()

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNoteTextFieldConstraints()
    }

    // MARK: UI Methods
    private func setupUI() {
        setupNavigationBar()
    }

    private func setupNavigationBar() {
        let addBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(addButtonAction))
        addBarButtonItem.tintColor = .black
        self.navigationItem.rightBarButtonItem = addBarButtonItem
        let cancelBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: #selector(cancelButtonAction))
        cancelBarButtonItem.tintColor = .black
        self.navigationItem.leftBarButtonItem = cancelBarButtonItem
    }

    private func setupNoteTextFieldConstraints() {
        self.view.addSubview(noteTextField)
        noteTextField.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
        noteTextField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
        noteTextField.heightAnchor.constraint(equalToConstant: 50),
        noteTextField.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
        noteTextField.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor)]
        NSLayoutConstraint.activate(constraints)
    }

    @objc private func addButtonAction(sender: UIBarButtonItem) {
        presenter?.addNewNote()
    }

    @objc private func cancelButtonAction(sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: AddNoteViewType
extension AddNoteViewController: AddNoteViewType { }
