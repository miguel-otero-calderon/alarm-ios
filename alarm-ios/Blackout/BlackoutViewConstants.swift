import Foundation

enum BlackoutViewConstants {
    static let blackoutBackgorund = "blackoutBackgorund"
    static let blackoutImage = "blackoutImage"
    static let headerHeight: CGFloat = 207
    static let iconWidth: CGFloat = 123
    static let iconHeight: CGFloat = 123
    static let iconTop: CGFloat = -60
    
    enum Title {
        static let fontSize: CGFloat = 22
        static let top: CGFloat = 49
        static let horizontal: CGFloat = 16
    }
    
    enum Message {
        static let fontSize: CGFloat = 16
        static let horizontal: CGFloat = 16
    }
    
    enum Footer {
        static let fontSize: CGFloat = 16
        static let top: CGFloat = 24
        static let horizontal: CGFloat = 16
    }
    
    enum DefaultValue {
        static let enable: Bool = true
        static let title: String = "Nuestra app está en mantención"
        static let message: String = "Porque queremos entregarte siempre un buen servicio, estamos trabajando para mejorar tu experiencia de compra."
        static let footer: String = "Pronto estará disponible."
    }
}

