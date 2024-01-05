import Foundation
import Combine

protocol BlackoutRemoteDataSourceProtocol: AnyObject {
    func startObserving() -> AnyPublisher<Blackout, Never>
}
