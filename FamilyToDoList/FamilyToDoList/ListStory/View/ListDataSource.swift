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

//        UITableViewCell.registerClass(for: tableView)
//        [StarMoneyTierAndCardCell.self,
//         StarMoneyTotalCardsCountCell.self,
//         StarMoneyTotalCardsMoneyCell.self,
//         StarMoneyCardCell.self,
//         StarMoneyTotalNoCardsCell.self
//        ].forEach { $0.registerNib(for: tableView) }
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
        return 10
//        guard let model = model else { return 0 }
//        guard let section = Sections(rawValue: section) else {
//            fatalError(Constants.dataInconsistencyError)
//        }
//        switch section {
//        case .cards:
//            return model.cards.count
//        default:
//            return 1
//        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
//        guard let model = model else { return UITableViewCell() }
//        guard let section = Sections(rawValue: indexPath.section) else {
//            fatalError(Constants.dataInconsistencyError)
//        }
//
//        switch section {
//        case .tierAndCard:
//            let cell: StarMoneyTierAndCardCell = .dequeue(from: tableView, for: indexPath)
//            cell.update(model: model.tierAndCard)
//            return cell
//        case .totalCardsCount:
//            let cell: StarMoneyTotalCardsCountCell = .dequeue(from: tableView, for: indexPath)
//            cell.update(text: model.totalCardsCountCaption)
//            return cell
//        case .totalCardsMoney:
//            let cell: StarMoneyTotalCardsMoneyCell = .dequeue(from: tableView, for: indexPath)
//            cell.update(model: model.totalCardsMoney, rewardsAvailable: !model.cards.isEmpty)
//            return cell
//        case .cards:
//            let cell: StarMoneyCardCell = .dequeue(from: tableView, for: indexPath)
//            cell.update(model: model.cards[indexPath.row])
//            return cell
//        case .totalNoCards:
//            let cell: StarMoneyTotalNoCardsCell = .dequeue(from: tableView, for: indexPath)
//            cell.update(text: model.starRewardsBottomButtonText)
//            cell.selectionStyle = .none
//            cell.accessoryType = .disclosureIndicator
//            return cell
//        }
    }
}

extension ListDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let section = Sections(rawValue: section) else {
            fatalError(Constants.dataInconsistencyError)
        }
        switch section {
        case .inProgress:
            return 20
        default:
            return 0
        }
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
