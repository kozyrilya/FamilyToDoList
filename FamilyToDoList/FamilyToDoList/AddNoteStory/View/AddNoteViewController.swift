//
//  AddNoteViewController.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 11/17/22.
//

import UIKit

final class AddNoteViewController: UIViewController {

    var presenter: AddNoteViewOutput?

    private var centerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20

        return stackView
    }()

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.text = AddNoteLocalizedStrings.Label.addNoteDescriptionLabelText
        label.textAlignment = .center

        return label
    }()

    private var noteTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 18)
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.borderWidth = 1

        return textView
    }()

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
    }

    // MARK: UI Methods
    private func setupUI() {
        setupNavigationBar()
        self.view.backgroundColor = .systemBackground
    }

    private func setupLayout() {
        setupCenterStackViewConstraints()
        centerStackView.addArrangedSubview(titleLabel)
        centerStackView.addArrangedSubview(noteTextView)
    }

    private func setupNavigationBar() {
        let addBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(addButtonAction))
        addBarButtonItem.tintColor = .black
        self.navigationItem.rightBarButtonItem = addBarButtonItem
        let cancelBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: #selector(cancelButtonAction))
        cancelBarButtonItem.tintColor = .black
        self.navigationItem.leftBarButtonItem = cancelBarButtonItem
    }

    private func setupCenterStackViewConstraints() {
        self.view.addSubview(centerStackView)
        centerStackView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            centerStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            centerStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            centerStackView.heightAnchor.constraint(equalToConstant: 200),
            centerStackView.widthAnchor.constraint(equalToConstant: self.view.frame.width - 40)]
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
