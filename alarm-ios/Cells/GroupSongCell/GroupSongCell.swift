//
//  GroupSongCell.swift
//  alarm-ios
//
//  Created by Miguel Otero on 18/09/22.
//

import UIKit

class GroupSongCell: UITableViewCell {
    //Outlets
    @IBOutlet weak var titleLabel: UILabel!
    //variables
    var data: GroupSongCellData?
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.text = Localizable.none
    }
    func configure(data: GroupSongCellData) {
        self.titleLabel.text = data.title
        self.data = data
    }
}
extension GroupSongCell: ProtocolCell {
    static var identifier: String { return "GroupSongCell" }
    static var heightCustom: CGFloat { return 50 }
}
struct GroupSongCellData {
    let title: String
}
