//
//  DaySelectViewController.swift
//  alarm-ios
//
//  Created by Miguel on 17/07/22.
//

import UIKit
protocol DaySelectViewControllerDelegate: AnyObject {
    func cancel()
    func done(days:[DayModel])
}
class DaySelectViewController: UIViewController {
    private lazy var containerView: UIView = setupContainerView()
    private lazy var tableView: UITableView = setupTableView()

    var cells: [CustomCell] = []
    var days: [DayModel]
    let cornerRadius: CGFloat = 20
    weak var delegate: DaySelectViewControllerDelegate?
    
    init(days: [DayModel], delegate: DaySelectViewControllerDelegate) {
        self.days = days
        self.delegate = delegate
        super.init(nibName: .none, bundle: .none)
        self.modalStyle(style: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        configTable()
        configCells()
        loadTable()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with _: UIEvent?) {
        let touch: UITouch? = touches.first
        if touch?.view == view {
            close()
        }
    }
    func close() {
        UIView.animate(withDuration: 0.5) {
            self.view.alpha = .zero
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.dismiss(animated: true)
        }
    }
    func setupContainerView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.systemBackground
        view.layer.cornerRadius =  self.cornerRadius
        return view
    }
    func setupView() {
        view.addSubview(containerView)
        containerView.addSubview(tableView)
    }
    func setupConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.heightAnchor.constraint(equalToConstant: 420).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    }
    func setupTableView() -> UITableView {
        let tableview = UITableView()
        tableview.separatorStyle = .none
        tableview.layer.cornerRadius =  self.cornerRadius
        return tableview
    }
    func configTable() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(TitleCell.self, forCellReuseIdentifier: TitleCell.identifier)
        self.tableView.register(DaysShortcutCell.self, forCellReuseIdentifier: DaysShortcutCell.identifier)
        self.tableView.register(DayCheckCell.self, forCellReuseIdentifier: DayCheckCell.identifier)
        self.tableView.register(UINib(nibName: CancelDoneCell.identifier, bundle: nil), forCellReuseIdentifier: CancelDoneCell.identifier)
        self.tableView.isScrollEnabled = false
        self.tableView.tableFooterView = UIView()
    }
    func configCells() {
        cells = []
        cells.append(.titleCell(TitleCell.ViewModel(title: Localizable.repeat)))
        cells.append(.daysShortcut)
        let days = GetDaysCheckViewModelUseCase().execute()
        for day in days {
            cells.append(.dayCheck(day))
        }
        cells.append(.cancelDoneCell(CancelDoneCellData(cancelTitle: Localizable.cancel, doneTitle: Localizable.done)))
    }
    func loadTable() {
        self.tableView.reloadData()
    }
}
extension DaySelectViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let custom = cells[indexPath.row]
        switch custom {
        case .daysShortcut:
            let cell = tableView.dequeueReusableCell(withIdentifier: DaysShortcutCell.identifier, for: indexPath) as! DaysShortcutCell
            cell.delegate = self
            return cell
        case .titleCell(let viewModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: TitleCell.identifier, for: indexPath) as! TitleCell
            cell.configure(viewModel: viewModel)
            return cell
        case .dayCheck(let viewModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: DayCheckCell.identifier, for: indexPath) as! DayCheckCell
            cell.configure(viewModel: viewModel)
            cell.delegate = self
            return cell
        case .cancelDoneCell(let data):
            let cell = tableView.dequeueReusableCell(withIdentifier: CancelDoneCell.identifier, for: indexPath) as! CancelDoneCell
            cell.configure(data: data)
            cell.delegate = self
            return cell
        default:
            let cell = UITableViewCell()
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            cell.contentView.backgroundColor = .clear
            return cell
        }
    }
}
extension DaySelectViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = cells[indexPath.row]
        switch cell {
        case .daysShortcut:
            return DaysShortcutCell.heightCustom
        case .titleCell(_):
            return TitleCell.heightCustom
        case .dayCheck(_):
            return DayCheckCell.heightCustom
        case .cancelDoneCell(_):
            return CancelDoneCell.heightCustom
        default :
            return 0
        }
    }
}
extension DaySelectViewController: DayCheckCellDelegate {
    func dayCheckAction(viewModel: DayCheckCell.ViewModel) {
        if viewModel.selected {
            days = AddDayUseCase(days: days, addDay: viewModel.day).execute()
        } else {
            days = RemoveDayUseCase(days: days, removeDay: viewModel.day).execute()
        }
    }
}
extension DaySelectViewController: CancelDoneCellDelegate {
    func cancel(cell: CancelDoneCell) {
        self.delegate?.cancel()
        self.dismiss(animated: true)
    }
    
    func done(cell: CancelDoneCell) {
        self.delegate?.done(days: self.days)
        self.dismiss(animated: true)
    }
}
extension DaySelectViewController: DaysShortcutCellDelegate {
    func weekDaysAction() {
        
    }
    
    func weekEndsAction() {
        
    }
}
