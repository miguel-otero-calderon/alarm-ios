//
//  SongCell.swift
//  alarm-ios
//
//  Created by Miguel on 20/07/22.
//

import UIKit

class SongCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    @IBOutlet weak var actionButton: UIButton!
    //variables
    var data: SongCellData?
    var delegate: SongCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        checkImage.isHidden = true
        songLabel.textColor = .systemBackground
    }
    
    @IBAction func actionCell(_ sender: UIButton) {
        delegate?.action(cell: self)
    }
    
    func configure(data: SongCellData) {
        self.songLabel.text = data.song.name
        self.data = data
    }
}

extension SongCell: ProtocolCell {
    static var identifier: String { return "SongCell" }
    static var heightCustom: CGFloat { return 50 }
}
struct SongCellData {
    let title: String
    let description: String
    let song: Song
}
protocol SongCellDelegate {
    func action(cell:SongCell)
}
