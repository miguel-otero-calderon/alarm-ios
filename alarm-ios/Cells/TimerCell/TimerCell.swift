//
//  TimerCell.swift
//  alarm-ios
//
//  Created by Miguel on 15/07/22.
//https://makeapppie.com/2014/10/21/swift-swift-formatting-a-uipickerview/
//

import UIKit

class TimerCell: UITableViewCell {
    //Outlets
    @IBOutlet weak var pickerView: UIPickerView!
    
    //variables
    private let hours = TimerUseCase.getHours()
    private let minutes = TimerUseCase.getMinutes()
    private let horarios = TimerUseCase.getHorarios()
    private let symbols = TimerUseCase.getSymbols()
    private let hourColumn = 0
    private let symbolColumn = 1
    private let minuteColumn = 2
    private let horarioColumn = 3
    var delegate:TimerCellDelegate?
    private var hour = TimerUseCase.getTimerDefault().hour
    private var minute = TimerUseCase.getTimerDefault().minute
    private var horario = TimerUseCase.getTimerDefault().horario.rawValue
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configurePickerView()
    }

    func configurePickerView() {
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    func configure(data: TimerCellData?) {
        guard let data = data else {
            return
        }
        if let index = hours.firstIndex(of: data.hour) {
            pickerView.selectRow(index, inComponent: hourColumn, animated: true)
        }
        if let index = minutes.firstIndex(of: data.minute) {
            pickerView.selectRow(index, inComponent: minuteColumn, animated: true)
        }
        if let index = horarios.firstIndex(of: data.horario) {
            pickerView.selectRow(index, inComponent: horarioColumn, animated: true)
        }
    }
}
extension TimerCell: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == hourColumn { return hours.count }
        if component == minuteColumn { return minutes.count }
        if component == horarioColumn { return horarios.count }
        if component == symbolColumn  { return symbols.count }
        return 0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == hourColumn {
            return hours[row]
        }
        if component == minuteColumn {
            return minutes[row]
        }
        if component == horarioColumn {
            return horarios[row]
        }
        if component == symbolColumn  {
            return symbols[row]
        }
        return nil
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var value:String?
        if component == hourColumn {
            value = hours[row]
        }
        if component == minuteColumn {
            value = minutes[row]
        }
        if component == horarioColumn {
            value = horarios[row]
        }
        if component == symbolColumn  {
            value = symbols[row]
        }
        guard let value = value else {
            return UILabel()
        }
        guard let font = UIFont(name: "Nunito-Black", size: 35.0) else {
            return UILabel()
        }
        let label = UILabel()
        let color = UIColor.label
        let title = NSAttributedString(string: value,
                                       attributes: [
                                        NSAttributedString.Key.font:font,
                                        NSAttributedString.Key.foregroundColor:color])
        label.attributedText = title
        if component == minuteColumn {
            label.textAlignment = .left
        } else {
            label.textAlignment = .center
        }
        
       return label
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == hourColumn {
            hour = hours[row]
        }
        if component == minuteColumn {
            minute = minutes[row]
        }
        if component == horarioColumn {
            horario = horarios[row]
        }
        delegate?.changeTime(cell: self, hour: hour, minute: minute, horario: horario)
    }
}

extension TimerCell: ProtocolCell {
    static var identifier: String { return "TimerCell" }
    static var heightCustom: CGFloat { return 250 }
}
struct TimerCellData {
    let hour: String
    let minute: String
    let horario: String
}
protocol TimerCellDelegate {
    func changeTime(cell: TimerCell, hour:String, minute:String, horario:String)
}
 
