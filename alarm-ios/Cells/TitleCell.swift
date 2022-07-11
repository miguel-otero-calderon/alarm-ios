//
//  TitleCell.swift
//  alarm-ios
//
//  Created by Miguel on 17/07/22.
//

import UIKit

class TitleCell: UITableViewCell {
    private lazy var containerView: UIView = setupContainerView()
    private lazy var titleLabel: UILabel = setupTitleLabel()
    
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
        containerView.addSubview(titleLabel)
    }
    func setupContraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true        
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
    func configure(viewModel: ViewModel) {
        self.titleLabel.text = viewModel.title
    }
    
    struct ViewModel {
        let title: String
    }
    
}
extension TitleCell: ProtocolCell {
    static var identifier: String { return "TitleCell" }
    static var heightCustom: CGFloat { return 40.0 }
}
