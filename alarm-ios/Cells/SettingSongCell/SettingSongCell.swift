//
//  SettingSongCell.swift
//  alarm-ios
//
//  Created by Miguel Otero on 18/09/22.
//

import UIKit

class SettingSongCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    //variables
    var data: SettingSongCellData?
    var delegate: SettingSongCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        resultLabel.textColor = UIColor.blue
    }
    
    @IBAction func actionCell(_ sender: UIButton) {
        delegate?.action(cell: self)
    }
    
    func configure(data: SettingSongCellData) {
        self.titleLabel.text = data.title
        self.data = data
        self.resultLabel.text = Localizable.none
        if let song = data.song {
            self.resultLabel.text = song.name
        }
    }
}

extension SettingSongCell: ProtocolCell {
    static var identifier: String { return "SettingSongCell" }
    static var heightCustom: CGFloat { return 50 }
}
struct SettingSongCellData {
    let title: String
    let song: Song?
}
protocol SettingSongCellDelegate {
    func action(cell:SettingSongCell)
}
