//
//  ListDataSource.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 11/16/22.
//

import UIKit

final class ListDataSource: NSObject {
    private weak var tableView: UITableView?

    private enum Sections: Int, CaseIterable {
        case inProgress
        case done
    }

//    var model: StarMoneyViewModel? {
//        didSet {
//            tableView?.reloadData()
//        }
//    }

    func bind(tableView: UITableView) {
        self.tableView = tableView
        NoteTableViewCell.registerNib(for: tableView, nibName: "NoteTableViewCell", reuseIdentifier: "NoteTableViewCell")
        DoneTableViewCell.registerNib(for: tableView, nibName: "DoneTableViewCell", reuseIdentifier: "DoneTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }

    private enum Constants {
        static let dataInconsistencyError = "Data inconsistency"
    }
}

extension ListDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard let model = model else { return 0 }
        guard let section = Sections(rawValue: section) else {
            fatalError(Constants.dataInconsistencyError)
        }

        switch section {
        case .inProgress:
            return 5
        case .done:
            return 2
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let model = model else { return UITableViewCell() }
        guard let section = Sections(rawValue: indexPath.section) else {
            fatalError(Constants.dataInconsistencyError)
        }

        switch section {
        case .inProgress:
            let cell: NoteTableViewCell = .dequeue(from: tableView, for: indexPath, with: "NoteTableViewCell")
            cell.configure(with: "Note number \(indexPath.row)")
            return cell
        case .done:
            let cell: DoneTableViewCell = .dequeue(from: tableView, for: indexPath, with: "DoneTableViewCell")
            cell.configure(with: "Done note number \(indexPath.row)")
            return cell
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let section = Sections(rawValue: section) else {
            fatalError(Constants.dataInconsistencyError)
        }

        switch section {
        case .inProgress:
            let view = UITableViewHeaderFooterView()
            view.textLabel?.text = TableViewHeadersLocalizedStrings.Label.notesLabelTitle
            return view
        case .done:
            let view = UITableViewHeaderFooterView()
            view.textLabel?.text = TableViewHeadersLocalizedStrings.Label.doneNoteLabelTitle
            return view
        }
    }
}

extension ListDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let section = Sections(rawValue: indexPath.section) else {
            fatalError(Constants.dataInconsistencyError)
        }
        if section == .inProgress {
//            model?.onStarRewardsTap()
            print("inProgress tapped")
        }
    }
}
