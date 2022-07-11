//
//  SettingSongModalViewController.swift
//  alarm-ios
//
//  Created by Miguel Otero on 18/09/22.
//

import UIKit

class SettingSongModalViewController: UIViewController {
    private lazy var tableView: UITableView = setupTableView()
    init() {
        super.init(nibName: .none, bundle: .none)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var cells:[CustomCell] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        configTable()
        configCells()
        self.tableView.reloadData()
    }
    func setupTableView() -> UITableView {
        let tableView = UITableView()
         return tableView
    }
    func configTable() {
        self.tableView.register(UINib(nibName: GroupSongCell.identifier, bundle: nil), forCellReuseIdentifier: GroupSongCell.identifier)
        self.tableView.register(UINib(nibName: CancelDoneCell.identifier, bundle: nil), forCellReuseIdentifier: CancelDoneCell.identifier)
        self.tableView.isScrollEnabled = false
        self.tableView.tableFooterView = UIView()
    }
    func configCells() {
        cells = []
        cells.append(.titleCell(TitleCell.ViewModel(title: Localizable.repeat)))
        cells.append(.cancelDoneCell(CancelDoneCellData(cancelTitle: Localizable.cancel, doneTitle: Localizable.done)))
    }
}
