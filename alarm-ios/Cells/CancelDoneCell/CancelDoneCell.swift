//
//  CancelOkCell.swift
//  alarm-ios
//
//  Created by Miguel on 18/07/22.
//

import UIKit

class CancelDoneCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    //variables
    var delegate: CancelDoneCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        delegate?.cancel(cell: self)
    }
    @IBAction func doneAction(_ sender: UIButton) {
        delegate?.done(cell: self)
    }
    func configure(data:CancelDoneCellData) {
        cancelButton.setTitle(data.cancelTitle, for: .normal)
        doneButton.setTitle(data.doneTitle, for: .normal)
    }
}
extension CancelDoneCell: ProtocolCell {
    static var identifier: String { return "CancelDoneCell" }
    static var heightCustom: CGFloat { return 50.0 }
}
protocol CancelDoneCellDelegate {
    func cancel(cell:CancelDoneCell)
    func done(cell:CancelDoneCell)
}
struct CancelDoneCellData {
    let cancelTitle:String
    let doneTitle:String
}
