import Foundation
import Combine
import UIKit

final class AddBlackoutUseCase: AddBlackoutUseCaseProtocol {
    private let blackoutRepository: BlackoutRepositoryProtocol
    private var cancellables: Set<AnyCancellable> = []
    private var hostingController: BlackoutViewHostingController?
    
    init(blackoutRepository: BlackoutRepositoryProtocol) {
        self.blackoutRepository = blackoutRepository
    }
    
    func execute() {
        do {
            try blackoutRepository.startObserving()
                .sink(
                    receiveValue: { [weak self] blackout in
                        guard let self = self else { return }
                        if blackout.enable {
                            self.addView(blackout: blackout)
                        } else {
                            self.removeView()
                        }
                    }
                )
                .store(in: &cancellables)
        } catch {
            //Not used
        }
    }
    
    private func addView(blackout: Blackout) {
        guard let visibleViewController = UIApplication.getVisibleViewController() else {
            return
        }
        hostingController = BlackoutViewHostingController(blackout: blackout)
        guard let hostingController = hostingController else {
            return
        }
        hostingController.modalPresentationStyle = .fullScreen
        visibleViewController.present(hostingController, animated: true)
    }
    
    private func removeView() {
        hostingController?.dismiss(animated: true)
    }
}
