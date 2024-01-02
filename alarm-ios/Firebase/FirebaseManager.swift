import Combine
import FirebaseDatabase

final class FirebaseManager {
    static let shared = FirebaseManager()
    
    private let dbRef: DatabaseReference
    @Published var blackoutData: Blackout?
    
    private init() {
        dbRef = Database.database().reference()
    }
    
    func startObserving() {
        observeBlackoutData()
    }
    
    private func observeBlackoutData() {
        dbRef.child("Blackout").observe(.value, with: { [weak self] data in
            guard let values = data.value as? [String: Any] else {
                self?.blackoutData = nil
                return
            }
            self?.blackoutData = self?.decodeResponse(response: values)
        })
    }
    
    private func decodeResponse(response: [String: Any]) -> Blackout {
        var data: Blackout
        do {
            let jsonSerialization = try JSONSerialization.data(withJSONObject: response, options: .prettyPrinted)
            data = try JSONDecoder().decode(Blackout.self, from: jsonSerialization)
            return data
        } catch {
            return Blackout(
                enable: false,
                title: String.empty,
                message: String.empty,
                footer: String.empty
            )
        }
    }
}

