//
//  AddDayUseCase.swift
//  alarm-ios
//
//  Created by Miguel Otero on 25/09/23.
//

import Foundation

final class AddDayUseCase {
    let days: [DayModel]
    let addDay: DayModel
    init(days: [DayModel], addDay: DayModel) {
        self.days = days
        self.addDay = addDay
    }
    func execute() -> [DayModel] {

        for item in days {
            if item.id == addDay.id {
                return days
            }
        }
        
        var result: [DayModel] = []
        for item in days {
            result.append(item)
        }
        result.append(addDay)
        return result
    }
}
