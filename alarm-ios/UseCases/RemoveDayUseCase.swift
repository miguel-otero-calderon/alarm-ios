//
//  RemoveDayUseCase.swift
//  alarm-ios
//
//  Created by Miguel Otero on 25/09/23.
//

import Foundation

final class RemoveDayUseCase {
    let days: [DayModel]
    let removeDay: DayModel
    init(days: [DayModel], removeDay: DayModel) {
        self.days = days
        self.removeDay = removeDay
    }
    func execute() -> [DayModel] {
        var result: [DayModel] = []
        for item in days {
            if item.id != removeDay.id {
                result.append(item)
            }
        }
        return result
    }
}
