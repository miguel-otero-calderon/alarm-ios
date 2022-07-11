//
//  ProtocolCell.swift
//  alarm-ios
//
//  Created by Miguel on 16/07/22.
//

import Foundation
import UIKit

protocol ProtocolCell {
    static var identifier: String {get}
    static var heightCustom: CGFloat {get}
}
