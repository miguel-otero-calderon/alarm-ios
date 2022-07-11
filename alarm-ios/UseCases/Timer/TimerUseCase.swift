//
//  TimerUseCase.swift
//  alarm-ios
//
//  Created by Miguel on 15/07/22.
//

import Foundation

struct TimerUseCase {
    //variable
    static private var hours:[String] = []
    static private var minutes:[String] = []
    static private var horarios:[String] = []
    static private var symbols:[String] = []
    //public
    static func getTimerDefault() -> Alarm.Time {
        let hour = "07"
        let minute = "30"
        let horario = Alarm.Time.Horario.am
        return Alarm.Time(hour: hour, minute: minute, horario: horario)
    }
    static func getHours() -> [String] {
        if hours.isEmpty {
            createHours()
        }
        return hours
    }
    
    static func getMinutes() -> [String] {
        if minutes.isEmpty {
            createMinutes()
        }
        return minutes
    }
    
    static func getHorarios() -> [String] {
        if horarios.isEmpty {
            createHorarios()
        }
        return horarios
    }
    
    static func getSymbols() -> [String] {
        if symbols.isEmpty {
            createSymbols()
        }
        return symbols
    }
    
    //private
    private static func createHours() {
        hours = []
        for _ in 1 ..< 5 {
            for number in 1 ..< 13 {
                let hour = String(format: "%02d", number)
                hours.append(hour)
            }
        }
    }
    
    private static func createMinutes() {
        minutes = []
        for _ in 1 ..< 9 {
            for number in 1 ..< 61 {
                let minute = String(format: "%02d", number)
                minutes.append(minute)
            }
        }
    }
    
    private static func createHorarios() {
        horarios = []
        horarios.append("AM")
        horarios.append("PM")
    }
    
    private static func createSymbols() {
        symbols = []
        symbols.append(":")
    }
}
