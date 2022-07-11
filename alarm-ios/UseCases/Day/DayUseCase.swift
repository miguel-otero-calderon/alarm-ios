//
//  DayUseCase.swift
//  alarm-ios
//
//  Created by Miguel on 17/07/22.
//

import Foundation
import UIKit

struct DayUseCase {
    //variable
    private static let monday = "monday"
    private static let tuesday = "tuesday"
    private static let wednesday = "wednesday"
    private static let thursday = "thursday"
    private static let friday = "friday"
    private static let saturday = "saturday"
    private static let sunday = "sunday"
    //public
    static func getDayName(day:String) -> String {
        switch day {
        case monday:
            return Localizable.monday
        case tuesday:
            return Localizable.tuesday
        case wednesday:
            return Localizable.wednesday
        case thursday:
            return Localizable.thursday
        case friday:
            return Localizable.friday
        case saturday:
            return Localizable.saturday
        case sunday:
            return Localizable.sunday
        default:
            return ""
        }
    }
    static func getTitle(days:[String], title:String = Localizable.repeat) -> String {
        if days.count == 0 {
            return title
        }
        if days.count == 1 {
            return "\(title) 1 \(Localizable.day)"
        }
        return "\(title) \(days.count) \(Localizable.days)"
    }
    static func getDescription(days:[String]) -> String {
        if days.count == 0 {
            return Localizable.never
        }
        if days.contains(monday) &&
            days.contains(tuesday) &&
            days.contains(wednesday) &&
            days.contains(thursday) &&
            days.contains(friday) &&
            days.contains(saturday) &&
            days.contains(sunday) && days.count == 7 {
            return Localizable.everyday
        }
        if days.contains(monday) &&
            days.contains(tuesday) &&
            days.contains(wednesday) &&
            days.contains(thursday) &&
            days.contains(friday) && days.count == 5 {
            return Localizable.weekdays
        }
        if days.contains(saturday) &&
            days.contains(sunday) && days.count == 2 {
            return Localizable.weekend
        }
        var text:String = ""
        let sortedDays = getSortedDays(days: days)
        for day in sortedDays {
            let name = getDayName(day: day)
            text = text + name.prefix(3) + ","
        }
        text = String(text.prefix(text.count - 1))
        return text
    }
    static func getSortedDays(days:[String]) -> [String] {
        var result: [String] = []
        if days.contains(monday) {
            result.append(monday)
        }
        if days.contains(tuesday) {
            result.append(tuesday)
        }
        if days.contains(wednesday) {
            result.append(wednesday)
        }
        if days.contains(thursday) {
            result.append(thursday)
        }
        if days.contains(friday) {
            result.append(friday)
        }
        if days.contains(saturday) {
            result.append(saturday)
        }
        if days.contains(sunday) {
            result.append(sunday)
        }
        return result
    }
    static func getDays() -> [String] {
        var days = [String]()
        days.append(monday)
        days.append(tuesday)
        days.append(wednesday)
        days.append(thursday)
        days.append(friday)
        days.append(saturday)
        days.append(sunday)
        return days
    }
    static func getDaysData(days:[String]) -> [DayCheckCell.ViewModel] {
        var viewModels: [DayCheckCell.ViewModel] = []
        let check: UIImage = UIImage(named: "check") ?? UIImage()
        let uncheck: UIImage = UIImage(named: "uncheck") ?? UIImage()
        
        var mondayViewModel = DayCheckCell.ViewModel(title: Localizable.monday, value: false, day: monday, check: check, uncheck: uncheck)
        var tuesdayViewModel = DayCheckCell.ViewModel(title: Localizable.tuesday, value: false, day: tuesday, check: check, uncheck: uncheck)
        var wednesdayViewModel = DayCheckCell.ViewModel(title: Localizable.wednesday, value: false, day: wednesday, check: check, uncheck: uncheck)
        var thursdayViewModel = DayCheckCell.ViewModel(title: Localizable.thursday, value: false, day: thursday, check: check, uncheck: uncheck)
        var fridayViewModel = DayCheckCell.ViewModel(title: Localizable.friday, value: false, day: friday, check: check, uncheck: uncheck)
        var saturdayViewModel = DayCheckCell.ViewModel(title: Localizable.saturday, value: false, day: saturday, check: check, uncheck: uncheck)
        var sundayViewModel = DayCheckCell.ViewModel(title: Localizable.sunday, value: false, day: sunday, check: check, uncheck: uncheck)
        
        if days.contains(monday) {
            mondayViewModel.value = true
        }
        if days.contains(tuesday) {
            tuesdayViewModel.value = true
        }
        if days.contains(wednesday) {
            wednesdayViewModel.value = true
        }
        if days.contains(thursday) {
            thursdayViewModel.value = true
        }
        if days.contains(friday) {
            fridayViewModel.value = true
        }
        if days.contains(saturday) {
            saturdayViewModel.value = true
        }
        if days.contains(sunday) {
            sundayViewModel.value = true
        }
        
        viewModels.append(mondayViewModel)
        viewModels.append(tuesdayViewModel)
        viewModels.append(wednesdayViewModel)
        viewModels.append(thursdayViewModel)
        viewModels.append(fridayViewModel)
        viewModels.append(saturdayViewModel)
        viewModels.append(sundayViewModel)
        
        return viewModels
    }
    
    static func addDay(days:[String], day:String) -> [String] {
        if days.contains(day) {
            return days
        } else {
            var clon = days
            clon.append(day)
            return clon
        }
    }
    static func removeDay(days:[String], day:String) -> [String] {
        var clon = days
        clon.removeAll { item in item == day }
        return clon
    }
    //private
}
