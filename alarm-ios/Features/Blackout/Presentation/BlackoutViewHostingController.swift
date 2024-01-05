import Foundation
import SwiftUI

class BlackoutViewHostingController: UIHostingController<BlackoutView> {
    
    init(blackout: Blackout) {
        let viewModel = BlackoutContainer.shared.blackoutViewModel(blackout)
        super.init(rootView: BlackoutView(viewModel: viewModel))
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
