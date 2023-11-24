//
//  AlarmSettingViewController.swift
//  alarm-ios
//
//  Created by Miguel on 15/07/22.
//

import UIKit

class AlarmSettingViewController: UIViewController {
    private lazy var containerView: UIView = setupContainerView()
    private lazy var tableView: UITableView = setupTableView()
    
    var cells: [CustomCell] = []
    var days: [DayModel] = []
    var timer:Alarm.Time = TimerUseCase.getTimerDefault()
    var song:Song = SongUseCase.getSongDefault().first!
    
    init() {
        super.init(nibName: .none, bundle: .none)
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
    func setupView() {
        view.addSubview(containerView)
        containerView.addSubview(tableView)
    }
    func setupConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    func setupContainerView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.systemBackground
        return view
    }
    func setupTableView() -> UITableView {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    }
    func configTable() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: TimerCell.identifier, bundle: nil), forCellReuseIdentifier: TimerCell.identifier)
        self.tableView.register(UINib(nibName: DayCell.identifier, bundle: nil), forCellReuseIdentifier: DayCell.identifier)
        self.tableView.register(UINib(nibName: SettingSongCell.identifier, bundle: nil), forCellReuseIdentifier: SettingSongCell.identifier)
        self.tableView.register(TitleCell.self, forCellReuseIdentifier: TitleCell.identifier)
        self.tableView.isScrollEnabled = false
        self.tableView.tableFooterView = UIView()
    }
    func configCells() {
        
        let titleViewModel = TitleCell.ViewModel(title: Localizable.repeat)
        
        let timerCellData = TimerCellData(hour: timer.hour,
                                          minute: timer.minute,
                                          horario: timer.horario.rawValue)

        let title = GetDaysTitleUseCase(days: days).execute()
        let dayCellData = DayCell.ViewModel(title: title,
                                      result: "",
                                      days: ["Monday","Tuesday","Wednesday"])
        let settingSongCellData = SettingSongCellData(title: Localizable.song,
                                                      song: nil)
        cells = [
            .titleCell(titleViewModel),
            .timerCell(timerCellData),
            .dayCell(dayCellData),
            .settingSongCell(settingSongCellData)
            ]
    }
    func loadTable() {
        self.tableView.reloadData()
    }
}
extension AlarmSettingViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let custom = cells[indexPath.row]
        switch custom {
        case .titleCell(let viewModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: TitleCell.identifier, for: indexPath) as! TitleCell
            cell.configure(viewModel: viewModel)
            cell.selectionStyle = .none
            return cell
        case .timerCell(let data):
            let cell = tableView.dequeueReusableCell(withIdentifier: TimerCell.identifier, for: indexPath) as! TimerCell
            cell.configure(data: data)
            cell.selectionStyle = .none
            cell.delegate = self
            return cell
        case .dayCell(let viewModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: DayCell.identifier, for: indexPath) as! DayCell
            cell.configure(viewModel: viewModel)
            cell.selectionStyle = .none
            cell.delegate = self
            return cell
        case .settingSongCell(let data):
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingSongCell.identifier, for: indexPath) as! SettingSongCell
            cell.configure(data: data)
            cell.selectionStyle = .none
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
extension AlarmSettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = cells[indexPath.row]
        switch cell {
        case .titleCell(_):
            return TitleCell.heightCustom
        case .timerCell(_):
            return TimerCell.heightCustom
        case .dayCell(_):
            return DayCell.heightCustom
        case .settingSongCell(_):
            return SettingSongCell.heightCustom
        default :
            return 0
        }
    }
}
extension AlarmSettingViewController: DayCellDelegate {
    func action(cell: DayCell) {
        let viewController = DaySelectViewController(days: self.days, delegate: self)
        self.present(viewController, animated: true)
    }
}
extension AlarmSettingViewController: DaySelectViewControllerDelegate {
    func cancel() {
        
    }
    
    func done(days: [DayModel]) {
        self.days = days
        configCells()
        loadTable()
    }
}
extension AlarmSettingViewController: TimerCellDelegate {
    func changeTime(cell: TimerCell, hour: String, minute: String, horario: String) {
        timer = Alarm.Time(hour: hour,
                           minute: minute,
                           horario: Alarm.Time.Horario.init(rawValue: horario) ?? .am)
        print("Timer now:\(timer)")
    }
}
