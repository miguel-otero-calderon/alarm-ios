import Foundation
import Combine

final class BlackoutRepository: BlackoutRepositoryProtocol {
    private let blackoutRemoteDataSource: BlackoutRemoteDataSourceProtocol
    private var cancellables: Set<AnyCancellable> = []
    private var blackout: CurrentValueSubject<Blackout, Never> = CurrentValueSubject(Blackout(enable: BlackoutViewConstants.DefaultValue.enable,
                                                                                              title: BlackoutViewConstants.DefaultValue.title,
                                                                                              message: BlackoutViewConstants.DefaultValue.message,
                                                                                              footer: BlackoutViewConstants.DefaultValue.footer))
    init(blackoutRemoteDataSource: BlackoutRemoteDataSourceProtocol) {
        self.blackoutRemoteDataSource = blackoutRemoteDataSource
    }
    
    @MainActor
    func startObserving() throws -> AnyPublisher<Blackout, Never> {
        blackoutRemoteDataSource.startObserving()
            .sink(
                receiveCompletion: { [weak self] completion in
                    if case .failure(_) = completion {
                        guard let self = self else { return }
                        blackout.send(Blackout(enable: BlackoutViewConstants.DefaultValue.enable,
                                                    title: BlackoutViewConstants.DefaultValue.title,
                                                    message: BlackoutViewConstants.DefaultValue.message,
                                                    footer: BlackoutViewConstants.DefaultValue.footer))
                    }
                },
                receiveValue: { [weak self] data in
                    guard let self = self else { return }
                    blackout.send(Blackout(
                        enable: data.enable,
                        title: data.title,
                        message: data.message,
                        footer: data.footer))
                }
            )
            .store(in: &cancellables)
        return blackout.eraseToAnyPublisher()
    }
}
