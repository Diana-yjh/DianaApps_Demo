import UIKit

protocol LibraryDIContainerProtocol {
    func makeLibraryFlowCoordinator(navigationController: UINavigationController) -> LibraryFlowCoordinator
}

final class LibraryDIContainer: LibraryDIContainerProtocol {
    lazy var photoService: PhotoService = {
        return PhotoService()
    }()
    
    func makeLibraryFlowCoordinator(navigationController: UINavigationController) -> LibraryFlowCoordinator {
        return LibraryFlowCoordinator(navigationController: navigationController, dependencies: self, viewModel: makeLibraryViewModel(), photoService: photoService)
    }
}

extension LibraryDIContainer {
    func makePhotoRepository() -> PhotoRepository {
        return PhotoRepository(photoService: photoService)
    }
    
    func makeRequestPhotoAuthUsecase() -> RequestPhotoAuthUsecaseProtocol {
        return RequestPhotoAuthUsecase(photoRepository: makePhotoRepository())
    }
    
    func makeGetFetchingAssetsUsecase() -> GetFetchingAssetsUseCaseProtocol {
        return GetFetchingAssetsUseCase(photoRepository: makePhotoRepository())
    }
    
    func makeDeleteSelectedAssetUsecase() -> DeleteSelectedAssetUseCaseProtocol {
        return DeleteSelectedAssetUseCase(photoRepository: makePhotoRepository())
    }
    
    func makeLibraryViewModel() -> LibraryViewModel {
        LibraryViewModel(requestPhotoAuthUsecase: makeRequestPhotoAuthUsecase(), getFetchingAssetsUsecase: makeGetFetchingAssetsUsecase(), deleteSelectedAssetUsecase: makeDeleteSelectedAssetUsecase() )
    }
}
