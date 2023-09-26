//
//  GetDaysTitleUseCase.swift
//  alarm-ios
//
//  Created by Miguel Otero on 25/09/23.
//

import Foundation

final class GetDaysTitleUseCase {
    let days: [DayModel]
    
    init(days: [DayModel]) {
        self.days = days
    }
    func execute() -> String {
        if days.count == 0 {
            return Localizable.repeat
        }
        if days.count == 1 {
            return "\(Localizable.repeat) 1 \(Localizable.day)"
        }
        return "\(Localizable.repeat) \(days.count) \(Localizable.days)"
    }
}
