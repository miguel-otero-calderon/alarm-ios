import Foundation
import Combine

protocol BlackoutRepositoryProtocol: AnyObject {
    func startObserving() throws -> AnyPublisher<Blackout, Never>
}
