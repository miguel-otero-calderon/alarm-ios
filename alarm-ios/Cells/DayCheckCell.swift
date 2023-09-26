//
//  DayCheckCell.swift
//  alarm-ios
//
//  Created by Miguel on 17/07/22.
//

import UIKit
protocol DayCheckCellDelegate {
    func dayCheckAction(viewModel: DayCheckCell.ViewModel)
}
class DayCheckCell: UITableViewCell {
    private lazy var containerView: UIView = setupContainerView()
    private lazy var nameLabel: UILabel = setupNameLabel()
    private lazy var checkImage: UIImageView = setupCheckImage()
    private lazy var actionButton: UIButton = setupActionButton()
    var viewModel: DayCheckCell.ViewModel?
    var delegate: DayCheckCellDelegate?
    let check: UIImage? = UIImage(named: "check")
    let uncheck: UIImage? = UIImage(named: "uncheck")
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
        containerView.addSubview(nameLabel)
        containerView.addSubview(checkImage)
        containerView.addSubview(actionButton)
    }
    func setupContraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        
        checkImage.translatesAutoresizingMaskIntoConstraints = false
        checkImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        checkImage.widthAnchor.constraint(equalToConstant: 24).isActive = true
        checkImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        checkImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    }
    func setupContainerView() -> UIView {
        let view = UIView()
        return view
    }
    func setupNameLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Nunito-Regular", size: 15)
        return label
    }
    func setupCheckImage() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }
    func setupActionButton() -> UIButton {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.addTarget(self, action: #selector(actionCell), for: .touchUpInside)
        return button
    }
    func configure(viewModel: DayCheckCell.ViewModel) {
        self.viewModel = viewModel
        self.nameLabel.text = viewModel.day.name
        if viewModel.selected {
            self.checkImage.image = check
        } else {
            self.checkImage.image = uncheck
        }
    }
    @objc func actionCell(_ sender: UIButton) {
        guard let viewModel = self.viewModel else {
            return
        }
        if viewModel.selected {
            self.checkImage.image = check
        } else {
            self.checkImage.image = uncheck
        }
        self.viewModel?.selected = !viewModel.selected
        self.delegate?.dayCheckAction(viewModel: viewModel)
    }
}
extension DayCheckCell {
    struct ViewModel {
        let day: DayModel
        var selected: Bool
    }
}
extension DayCheckCell: ProtocolCell {
    static var identifier: String { return "DayCheckCell" }
    static var heightCustom: CGFloat { return 40.0 }
}
