//
//  GetDaysViewModelUseCase.swift
//  alarm-ios
//
//  Created by Miguel Otero on 25/09/23.
//

import Foundation
import UIKit

final class GetDaysCheckViewModelUseCase {
    func execute() ->[DayCheckCell.ViewModel] {
        [
            DayCheckCell.ViewModel(day: DayModel.monday, selected: false),
            DayCheckCell.ViewModel(day: DayModel.tuesday, selected: false),
            DayCheckCell.ViewModel(day: DayModel.wednesday, selected: false),
            DayCheckCell.ViewModel(day: DayModel.thursday, selected: false),
            DayCheckCell.ViewModel(day: DayModel.friday, selected: false),
            DayCheckCell.ViewModel(day: DayModel.saturday, selected: false),
            DayCheckCell.ViewModel(day: DayModel.sunday, selected: false),
        ]
    }
}
