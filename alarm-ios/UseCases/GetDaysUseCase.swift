//
//  GetDaysUseCase.swift
//  alarm-ios
//
//  Created by Miguel Otero on 25/09/23.
//

import Foundation

final class GetDaysUseCase {
    func execute() -> [DayModel] {
        [
            DayModel.monday,
            DayModel.tuesday,
            DayModel.wednesday,
            DayModel.thursday,
            DayModel.friday,
            DayModel.saturday,
            DayModel.sunday
        ]
    }
}
