//
//  InitViewControllerUseCase.swift
//  alarm-ios
//
//  Created by Miguel on 15/07/22.
//

import Foundation
import UIKit

final class InitialViewControllerUseCase {
    func execute() -> UIViewController {
        let viewController = AlarmSettingViewController()
        return viewController
    }
}
