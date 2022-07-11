//
//  Alarm.swift
//  alarm-ios
//
//  Created by Miguel on 11/07/22.
//

import Foundation

struct Alarm {
    let song: Song
    let time: Time
    let days: [Day]
    
    enum Day: String {
        case monday
        case tuesday
        case wednesday
        case thursday
        case friday
        case saturday
        case sunday
    }
    
    struct Time {
        let hour: String
        let minute: String
        let horario: Horario
        
        enum Horario: String {
            case am = "AM"
            case pm = "PM"
        }
    }
    
    
}

