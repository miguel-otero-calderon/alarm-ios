import SwiftUI
@MainActor
final class BlackoutViewModel: ObservableObject {
    @Published var enable: Bool = false
    @Published var title: String = .empty
    @Published var message: String = .empty
    @Published var footer: String = .empty
    
    init(blackout: Blackout) {
        self.enable = blackout.enable
        self.title = blackout.title
        self.message = blackout.message
        self.footer = blackout.footer
    }
}
