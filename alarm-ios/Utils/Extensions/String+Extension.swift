import Foundation

extension String {
    public static let empty = ""
    public static let space = " "
    public static let colon = ":"
    public static let slash = "/"
    public static let doubleSlash = "//"
    public static let doubleSlashInverted = "\\"
    public static let quote = "'"
    public static let questionMarkEncoded = "%3f"
    public static let questionMark = "?"
    public static let dot = "."
    public static let enter = "\n"
    public static let comma = ","
}

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

    func localized(fromTable table: String) -> String {
        return NSLocalizedString(self, tableName: table, comment: "")
    }

    func date(with format: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: self) ?? Date()
    }
    
    func dateFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "d 'de' MMMM, HH:mm"
            dateFormatter.locale = Locale(identifier: "es_ES")
            
            return dateFormatter.string(from: date)
        } else {
            return .empty
        }
    }

    func removingHTMLTags() -> String {
        let pattern = "<.*?>"
        guard let regex = try? NSRegularExpression(pattern: pattern) else { return self }
        let range = NSRange(startIndex..., in: self)
        return regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: .empty)
    }
}

