import Foundation
import UIKit

extension UIApplication {
    static func getVisibleViewController() -> UIViewController? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = windowScene.windows.first(where: { $0.isKeyWindow })?.rootViewController else {
            return nil
        }
        return findVisibleViewController(vc: rootViewController)
    }

    private static func findVisibleViewController(vc: UIViewController) -> UIViewController? {
        if let navigationController = vc as? UINavigationController {
            return findVisibleViewController(vc: navigationController.visibleViewController ?? navigationController)
        } else if let tabBarController = vc as? UITabBarController {
            return findVisibleViewController(vc: tabBarController.selectedViewController ?? tabBarController)
        } else if let presented = vc.presentedViewController {
            return findVisibleViewController(vc: presented)
        }
        return vc
    }
}
