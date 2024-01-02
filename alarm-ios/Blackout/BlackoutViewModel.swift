import SwiftUI

class BlackoutViewModel: ObservableObject {
    @Published var enable: Bool = false
    @Published var title: String = .empty
    @Published var message: String = .empty
    @Published var footer: String = .empty

    init(enable: Bool, title: String, message: String, footer: String) {
        self.enable = enable
        self.title = title
        self.message = message
        self.footer = footer
    }
}

