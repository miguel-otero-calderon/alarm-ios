import UIKit

extension UIColor {
    /// Color utilizado en textos principales ej: nombre de producto.
    /// - #333333 / r:51, g:51, b:51 / blackJumbo
    static var blackJumbo: UIColor {
        return UIColor(red: 51 / 255, green: 51 / 255, blue: 51 / 255, alpha: 1)
    }

    /// Color corporativo en textos secundarios.
    /// - #848484 / r:132, g:132, b:132 / grayDark
    static var grayDark: UIColor {
        return UIColor(red: 132 / 255, green: 132 / 255, blue: 132 / 255, alpha: 1)
    }

    /// Color utilizado card de producto para sección display (kg, gr)
    /// - #888888 / r:136, g:136, b:136 / grayJumbo
    static var grayJumbo: UIColor {
        return UIColor(red: 136 / 255, green: 136 / 255, blue: 136 / 255, alpha: 1)
    }

    /// Color utilizado en placeholders y botones que no estén habilitados.
    /// - #D3D3D3 / r:211, g:211, b:211
    static var grayLight: UIColor {
        return UIColor(red: 211 / 255, green: 211 / 255, blue: 211 / 255, alpha: 1)
    }

    /// Color corporativo utilizado en toolbar, iconos, resaltar palabras y links.
    /// - #0A8920 / r:10, g:137, b:32 / greenJumbo
    static var greenJumbo: UIColor {
        return UIColor(red: 0.039, green: 0.537, blue: 0.125, alpha: 1.00)
    }

    /// Color utilizado en los botones que llamen a una acción.
    /// - #A4C735 / r:164, g:199, b:53 / greenPistachio
    static var greenPistachio: UIColor {
        return UIColor(red: 164 / 255, green: 199 / 255, blue: 53 / 255, alpha: 1)
    }

    /// Color utilizado al presionar en los botones.
    /// - #89A530 / r:137, g:165, b:48
    static var greenDarkPistachio: UIColor {
        return UIColor(red: 137 / 255, green: 165 / 255, blue: 48 / 255, alpha: 1)
    }

    /// Color utilizado como fondo del botón del carro.
    /// - background: #046017; / r:4, g:96, b:23
    static var greenBackgroundCartButton: UIColor {
        return UIColor(red: 4 / 255, green: 96 / 255, blue: 23 / 255, alpha: 1)
    }

    /// Color Tarjeta Cencosud Scotiabank.
    /// - #Ec1164  / r:236, g:17, b:100
    static var pinkCencosud: UIColor {
        return UIColor(red: 236 / 255, green: 17 / 255, blue: 100 / 255, alpha: 1)
    }

    /// Color utilizado en notificaciones y textos de alerta.
    /// - #C00000 / r:192, g:0, b:0
    static var redError: UIColor {
        return UIColor(red: 192 / 255, green: 0 / 255, blue: 0 / 255, alpha: 1)
    }

    /// Color utilizado para el background de la app.
    /// - #F4F4F4  / r:244, g:244, b:244 / whiteJumbo
    static var whiteJumbo: UIColor {
        return UIColor(red: 244 / 255, green: 244 / 255, blue: 244 / 255, alpha: 1)
    }

    /// Color utilizado para mensajes de información
    /// - #F8F5CA
    static var yellowInfo: UIColor {
        return UIColor(red: 248 / 255, green: 245 / 255, blue: 202 / 255, alpha: 1)
    }
    
    /// Color utilizado para mensajes de información
    /// - #F8F5CA
    static var yellowPromoPill: UIColor {
        return UIColor(red: 248 / 255, green: 230 / 255, blue: 136 / 255, alpha: 1)
    }

    /// Color utilizado para los separadores de sección en tablas
    /// - #F5F5F5
    static var separatorDefault: UIColor {
        return UIColor(red: 245 / 255, green: 245 / 255, blue: 245 / 255, alpha: 1)
    }

    /// Color utilizado en notificaciones y textos de alerta.
    /// - #D60000 / r:214, g:0, b:0 / guardswmanRed
    static var guardswmanRed: UIColor {
        return UIColor(red: 214 / 255, green: 0 / 255, blue: 0 / 255, alpha: 1)
    }

    // MARK: - Grises

    /// Color utilizado en textos principales ej: nombre de producto.
    /// - #333333 / r:51, g:51, b:51 / blackNight
    static var blackNight: UIColor {
        return UIColor(red: 51 / 255, green: 51 / 255, blue: 51 / 255, alpha: 1)
    }

    /// Color utilizado en textos para nombres de producto.
    /// - #666666 / r:102, g:102, b:102 / doveGray
    static var doveGray: UIColor {
        return UIColor(red: 102 / 255, green: 102 / 255, blue: 102 / 255, alpha: 1)
    }

    /// Color utilizado card de producto para sección display (kg, gr)
    /// - #888888 / r:136, g:136, b:136 / gray
    static var grey: UIColor {
        return UIColor(red: 136 / 255, green: 136 / 255, blue: 136 / 255, alpha: 1)
    }

    /// Margen card de producto y textos secundarios como precio anterior. Elementos desabilitados
    /// - #C0C0C0 / r:192, g:192, b:192 / silver
    static var silver: UIColor {
        return UIColor(red: 192 / 255, green: 192 / 255, blue: 192 / 255, alpha: 1)
    }

    /// Background precio T. Cencosud en card de producto. Lineas de separación
    /// - #E2E2E2 / r:226, g:226, b:226 / mercury
    static var mercury: UIColor {
        return UIColor(red: 226 / 255, green: 226 / 255, blue: 226 / 255, alpha: 1)
    }

    /// Color utilizado para el background de la app. Fondos y separadores.
    /// - #F5F5F5  / r:245, g:245, b:245 / whiteSmoke
    static var whiteSmoke: UIColor {
        return UIColor(red: 245 / 255, green: 245 / 255, blue: 245 / 255, alpha: 1)
    }

    static var buttonDisabledText: UIColor {
        return UIColor(red: 170 / 255, green: 170 / 255, blue: 170 / 255, alpha: 1)
    }

    static var buttonDisabledBackground: UIColor {
        return UIColor(red: 242 / 255, green: 242 / 255, blue: 242 / 255, alpha: 1)
    }

    // MARK: - Spid - Primarios

    static var greyPrice: UIColor {
        return UIColor(red: 102 / 255, green: 102 / 255, blue: 102 / 255, alpha: 1)
    }

    // MARK: - Primary Colors

    /// Color corporativo utilizado en toolbar, iconos, resaltar palabras y links.
    /// - #8981EF / r:137, g:129, b:239
    static var primarySpid: UIColor {
        return UIColor(red: 137 / 255, green: 129 / 255, blue: 239 / 255, alpha: 1)
    }

    /// Color utilizado en bienvenidas y direccionales.
    /// - #EB6855 / r:235, g:104, b:85
    static var bittersweet: UIColor {
        return UIColor(red: 235 / 255, green: 104 / 255, blue: 85 / 255, alpha: 1)
    }

    /// Color utilizado en precios y ofertas.
    /// - #21D596 / r:33, g:213, b:150
    static var greenOffer: UIColor {
        return UIColor(red: 33 / 255, green: 213 / 255, blue: 150 / 255, alpha: 1)
    }

    // MARK: - Spid - Complementarios

    /// Color utilizado en los botones que llamen a una acción.
    /// - #FDBD4A / r:253, g:189, b:74
    static var actionColor: UIColor {
        return UIColor(red: 253 / 255, green: 189 / 255, blue: 74 / 255, alpha: 1)
    }

    /// Color utilizado al presionar en los botones.
    /// - #E3AA42 / r:227, g:170, b:66
    static var actionDark: UIColor {
        return UIColor(red: 227 / 255, green: 170 / 255, blue: 66 / 255, alpha: 1)
    }

    /// Color utilizado en notificaciones y textos de alerta.
    /// - #E8308A / r:232, g:48, b:138
    static var deepCerise: UIColor {
        return UIColor(red: 232 / 255, green: 48 / 255, blue: 138 / 255, alpha: 1)
    }

    /// Color utilizado de momento en link para Dark mode.
    /// - #00E183 / r:0, g:225, b:131
    static var greenLeaf: UIColor {
        return UIColor(red: 0 / 255, green: 225 / 255, blue: 131 / 255, alpha: 1)
    }

    // MARK: - Sisa - Primarios

    /// Hover y elementos decorativos.
    /// - #D91E18 / r:217, g:30, b:24, a:1 / Thunderbird
    static var thunderbird: UIColor {
        return UIColor(red: 217 / 255, green: 30 / 255, blue: 24 / 255, alpha: 1)
    }

    /// Botones / Acción encendido.
    /// - #F03434 / r:240, g:52, b:52, a:1 / Pomegranate
    static var pomegranate: UIColor {
        return UIColor(red: 240 / 255, green: 52 / 255, blue: 52 / 255, alpha: 1)
    }

    /// Precio oferta.
    /// - #FF600A / r:255, g:96, b:10, a:1 / BlazeOrange
    static var blazeOrange: UIColor {
        return UIColor(red: 255 / 255, green: 96 / 255, blue: 10 / 255, alpha: 1)
    }

    // MARK: - Sisa - Complementarios

    /// Exclusivo Internet y link.
    /// - #4DAEA9 / r:77, g:174, b:169, a:1 / Tradewind
    static var tradewind: UIColor {
        return UIColor(red: 77 / 255, green: 174 / 255, blue: 169 / 255, alpha: 1)
    }

    /// Color utilizado de momento en link para Dark mode.
    /// - #FFB600 / r:255, g:182, b:0
    static var yellowLink: UIColor {
        return UIColor(red: 255 / 255, green: 182 / 255, blue: 0 / 255, alpha: 1)
    }

    /// Ranking.
    /// - #F6C506 / r:246, g:197, b:6, a:1 / Corn
    static var corn: UIColor {
        return UIColor(red: 246 / 255, green: 197 / 255, blue: 6 / 255, alpha: 1)
    }

    /// Color utilizado en PDP precios.
    /// - #6359E8
    static var pdpPrice: UIColor {
        return UIColor(red: 99 / 255, green: 89 / 255, blue: 232 / 255, alpha: 1)
    }

    /// Color utilizado para los separadores en modal terminos y condiciones
    /// - #EAEAEA
    static var separatorTermsAndConditions: UIColor {
        return UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
    }

    static var separatorOrderLink: UIColor {
        return UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
    }

    /// Color utilizado en modal informativo
    /// - #D8185B / r:216, g:24, b:91
    static var redModal: UIColor {
        return UIColor(red: 216 / 255, green: 24 / 255, blue: 91 / 255, alpha: 1)
    }

    /// Color utilizado en modal informativo
    /// - #6A6A6A / r:106, g:106, b:106
    static var modalBlack: UIColor {
        return UIColor(red: 106 / 255, green: 106 / 255, blue: 106 / 255, alpha: 1)
    }

    /// Color Textos subrayados en TaC
    /// - #E1195F
    static var darkCherry: UIColor {
        return UIColor(red: 0.882, green: 0.098, blue: 0.373, alpha: 1.00)
    }

    /// Color CencoPay
    /// - #0B66FF
    static var blueCencoPay: UIColor {
        return UIColor(red: 0.043, green: 0.4, blue: 1, alpha: 1)
    }
    
    /// Pildora promociones en celda productos
    /// - #CA4900
    static var venetianRed: UIColor {
        return UIColor(red: 0.792, green: 0.285, blue: 0, alpha: 1)
    }

    static var whiteGiftCard: UIColor {
        return UIColor(red: 0.980, green: 0.980, blue: 0.980, alpha: 1.00)
    }

    /// Color Verde nuevo
    /// - #1FA02E
    static var greenJumboLight: UIColor {
        return UIColor(red: 0.122, green: 0.627, blue: 0.180, alpha: 1.00)
    }

    /// Color Gris componentes deshabilitados
    /// - #1FA02E
    static var neutral200: UIColor {
        return UIColor(red: 0.906, green: 0.922, blue: 0.918, alpha: 1.00)
    }

    /// Color Gris textos deshabilitados
    /// - #90A3A3
    static var neutral400: UIColor {
        return UIColor(red: 0.565, green: 0.639, blue: 0.639, alpha: 1.00)
    }
    
    // MARK: - Text View Colors.
    static var textViewborder: UIColor {
        return UIColor(red: 129 / 255, green: 129 / 255, blue: 129 / 255, alpha: 1)
    }

    static var textViewPlaceholder: UIColor {
        return UIColor(red: 129 / 255, green: 129 / 255, blue: 129 / 255, alpha: 1)
    }

    static var textViewText: UIColor {
        return UIColor(red: 51 / 255, green: 51 / 255, blue: 51 / 255, alpha: 1)
    }
}


public extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x0000_00FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue = CGFloat(b) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }

    convenience init(hex: Int, alpha: CGFloat) {
        let r = CGFloat((hex & 0xFF0000) >> 16)/255
        let g = CGFloat((hex & 0xFF00) >> 8)/255
        let b = CGFloat(hex & 0xFF)/255
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }

    convenience init(hex: Int) {
        self.init(hex: hex, alpha: 1.0)
    }

    /**
     Creates an UIColor from HEX String in "#363636" format

     - parameter hexString: HEX String in "#363636" format
     - returns: UIColor from HexString
     */
    convenience init(hexString: String) {

        let hexString: String = (hexString as NSString).trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString as String)

        if hexString.hasPrefix("#") {
            scanner.currentIndex = scanner.string.index(after: scanner.string.startIndex)
        }

        var color: UInt64 = 0
        scanner.scanHexInt64(&color)

        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask

        let red = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue = CGFloat(b) / 255.0
        self.init(red: red, green: green, blue: blue, alpha:1)
    }

    /// Create UIColor from RGB values with optional transparency.
    ///
    /// - Parameters:
    ///   - red: red component.
    ///   - green: green component.
    ///   - blue: blue component.
    ///   - transparency: optional transparency value (default is 1)
    convenience init(red: Int, green: Int, blue: Int, transparency: CGFloat = 1) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        var trans: CGFloat {
            if transparency > 1 {
                return 1
            } else if transparency < 0 {
                return 0
            } else {
                return transparency
            }
        }
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: trans)
    }
    
    func toHexString() -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb: Int = (Int)(r * 255) << 16 | (Int)(g * 255) << 8 | (Int)(b * 255) << 0
        return String(format: "#%06x", rgb)
    }
}

