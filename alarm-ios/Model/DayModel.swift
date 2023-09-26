//
//  DayUseCase.swift
//  alarm-ios
//
//  Created by Miguel on 17/07/22.
//

import Foundation
import UIKit

enum DayModel {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
    var id: Int {
        switch self {
        case .monday:
            return 1
        case .tuesday:
            return 2
        case .wednesday:
            return 3
        case .thursday:
            return 4
        case .friday:
            return 5
        case .saturday:
            return 6
        case .sunday:
            return 7
        }
    }
    var name: String {
        switch self {
        case .monday:
            return Localizable.monday
        case .tuesday:
            return Localizable.tuesday
        case .wednesday:
            return Localizable.wednesday
        case .thursday:
            return Localizable.thursday
        case .friday:
            return Localizable.friday
        case .saturday:
            return Localizable.saturday
        case .sunday:
            return Localizable.sunday
        }
    }
}
