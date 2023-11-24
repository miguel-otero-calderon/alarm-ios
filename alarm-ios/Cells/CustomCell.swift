//
//  CustomCell.swift
//  alarm-ios
//
//  Created by Miguel on 16/07/22.
//

import Foundation

enum CustomCell {
    case timerCell (TimerCellData)
    case dayCell (DayCell.ViewModel)
    case titleCell (TitleCell.ViewModel)
    case dayCheck (DayCheckCell.ViewModel)
    case cancelDoneCell (CancelDoneCellData)
    case settingSongCell (SettingSongCellData)
    case daysShortcut
}
