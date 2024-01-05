import Foundation
import FirebaseDatabase
import Combine

final class BlackoutRemoteDataSource: BlackoutRemoteDataSourceProtocol {
    private var databaseReference: DatabaseReference
    private var database: String
    init(databaseReference: DatabaseReference, database: String) {
        self.databaseReference = databaseReference
        self.database = database
    }
    
    func startObserving() -> AnyPublisher<Blackout, Never> {
        let subject = PassthroughSubject<Blackout, Never>()

        self.databaseReference.child(self.database).observe(.value) { snapshot in
            guard let value = snapshot.value as? [String: Any] else { return }
            let blackout = self.decodeResponse(response: value)
            subject.send(blackout)
        }

        return subject.eraseToAnyPublisher()
    }
    func startObservingOld() -> AnyPublisher<Blackout, Never> {
        return Deferred {
            Future<Blackout, Never> { promise in
                self.databaseReference.child(self.database).observe(.value) { data in
                    guard let values = data.value as? [String: Any] else {
                        return
                    }
                    let blackout = self.decodeResponse(response: values)
                    promise(.success(blackout))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    private func decodeResponse(response: [String: Any]) -> Blackout {
        var data: Blackout
        do {
            let jsonSerialization = try JSONSerialization.data(withJSONObject: response, options: .prettyPrinted)
            data = try JSONDecoder().decode(Blackout.self, from: jsonSerialization)
            return data
        } catch {
            let blackout = Blackout(enable: BlackoutViewConstants.DefaultValue.enable,
                            title: BlackoutViewConstants.DefaultValue.title,
                            message: BlackoutViewConstants.DefaultValue.message,
                            footer: BlackoutViewConstants.DefaultValue.footer)
            return blackout
        }
    }

}
