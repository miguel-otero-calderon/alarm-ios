import Factory
import Foundation
import Combine
import FirebaseDatabase

final class BlackoutContainer: SharedContainer {
        
    public static var shared = BlackoutContainer()
    public var manager = ContainerManager()
    
    private let database: String = "Blackout"
    private lazy var databaseReference: DatabaseReference = Database.database().reference()
    
    private var blackoutRemoteDataSource: Factory<BlackoutRemoteDataSourceProtocol> {
        self {
            BlackoutRemoteDataSource(databaseReference: self.databaseReference,
                                     database: self.database)
        }.singleton
    }
    
    private var blackoutRepository: Factory<BlackoutRepositoryProtocol> {
        self {
            BlackoutRepository(blackoutRemoteDataSource: self.blackoutRemoteDataSource())
        }.singleton
    }
    
    var addBlackoutUseCase: Factory<AddBlackoutUseCaseProtocol> {
        self {
            AddBlackoutUseCase(blackoutRepository: self.blackoutRepository())
        }
    }
    
    @MainActor
    var blackoutViewModel: ParameterFactory<Blackout, BlackoutViewModel> {
        self {
            BlackoutViewModel(blackout: $0)
        }
    }
}


