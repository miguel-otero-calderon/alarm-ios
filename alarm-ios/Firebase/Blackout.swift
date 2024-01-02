//
//  Blackout.swift
//  alarm-ios
//
//  Created by Miguel Otero on 1/01/24.
//

import Foundation

struct Blackout: Codable {
    var enable: Bool
    var title: String
    var message: String
    var footer: String
}
