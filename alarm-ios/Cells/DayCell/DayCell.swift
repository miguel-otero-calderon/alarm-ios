//
//  DaysCell.swift
//  alarm-ios
//
//  Created by Miguel on 17/07/22.
//

import UIKit
protocol DayCellDelegate {
    func action(cell:DayCell)
}
class DayCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!

    var viewModel: DayCell.ViewModel?
    var delegate: DayCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        resultLabel.textColor = UIColor.blue
    }
    
    @IBAction func actionCell(_ sender: UIButton) {
        delegate?.action(cell: self)
    }
    
    func configure(viewModel: ViewModel) {
        self.titleLabel.text = viewModel.title
        self.resultLabel.text = viewModel.result
        self.viewModel = viewModel
    }
    struct ViewModel {
        let title: String
        let result: String
        let days: [String]
    }
}

extension DayCell: ProtocolCell {
    static var identifier: String { return "DayCell" }
    static var heightCustom: CGFloat { return 50 }
}
