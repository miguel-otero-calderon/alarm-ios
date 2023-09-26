//
//  DaysCell.swift
//  alarm-ios
//
//  Created by Miguel on 17/07/22.
//

import UIKit

class DayCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!

    var data: DayCellData?
    var delegate: DayCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        resultLabel.textColor = UIColor.blue
    }
    
    @IBAction func actionCell(_ sender: UIButton) {
        delegate?.action(cell: self)
    }
    
    func configure(data: DayCellData) {
        self.titleLabel.text = data.title
        self.resultLabel.text = data.result
        self.data = data
    }
}

extension DayCell: ProtocolCell {
    static var identifier: String { return "DayCell" }
    static var heightCustom: CGFloat { return 50 }
}
struct DayCellData {
    let title: String
    let result: String
    let days: [String]
}
protocol DayCellDelegate {
    func action(cell:DayCell)
}
