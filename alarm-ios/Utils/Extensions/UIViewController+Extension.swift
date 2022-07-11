//
//  UIViewController+Extension.swift
//  alarm-ios
//
//  Created by Miguel Otero on 19/09/23.
//

import Foundation
import UIKit

extension UIViewController {
    func modalStyle(style: ModalStyle) {
        switch style {
        case .normal:
            let color = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
            view.backgroundColor = color.withAlphaComponent(CGFloat(0.5))
            modalPresentationStyle = .overFullScreen
            modalTransitionStyle = .coverVertical
        }
    }
    
    enum ModalStyle {
        case normal
    }
}
