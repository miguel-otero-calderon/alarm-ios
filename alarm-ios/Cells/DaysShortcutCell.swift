//
//  DaysShortcutCell.swift
//  alarm-ios
//
//  Created by Miguel Otero on 19/09/23.
//

import UIKit

class DaysShortcutCell: UITableViewCell {
    private lazy var containerView: UIView = setupContainerView()
    private lazy var weekDaysButton: UIButton = setupWeekDaysButton()
    private lazy var weekEndsButton: UIButton = setupWeekEndsButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupContraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupView() {
        contentView.addSubview(containerView)
        containerView.addSubview(weekDaysButton)
        containerView.addSubview(weekEndsButton)
    }
    func getWidthButton() -> CGFloat {
        let width = contentView.frame.width - 20
        let result = (width - 15)/2
        return result
    }
    func setupContraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        weekDaysButton.translatesAutoresizingMaskIntoConstraints = false
        weekDaysButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5).isActive = true
        weekDaysButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5).isActive = true
        weekDaysButton.widthAnchor.constraint(equalToConstant: getWidthButton()).isActive = true
        weekDaysButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5).isActive = true
        
        weekEndsButton.translatesAutoresizingMaskIntoConstraints = false
        weekEndsButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5).isActive = true
        weekEndsButton.leadingAnchor.constraint(equalTo: weekDaysButton.trailingAnchor, constant: 5).isActive = true
        weekEndsButton.widthAnchor.constraint(equalToConstant: getWidthButton()).isActive = true
        weekEndsButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5).isActive = true
    }
    func setupWeekEndsButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Weekends", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont(name: "Nunito-Regular", size: 15.0)
        return button
    }
    func setupWeekDaysButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Weekdays", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont(name: "Nunito-Regular", size: 15.0)
        return button
    }
    func setupContainerView() -> UIView {
        let view = UIView()
        return view
    }
    func setupTitleLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }
}
extension DaysShortcutCell: ProtocolCell {
    static var identifier: String { return "DaysShortcutCell" }
    static var heightCustom: CGFloat { return 40.0 }
}

