import UIKit

protocol AlbumDIContainerProtocol {
    func makeAlbumFlowCoordinator(navigationController: UINavigationController) -> AlbumFlowCoordinator
}

final class AlbumDIContainer: AlbumDIContainerProtocol {
    lazy var photoService: PhotoService = {
        return PhotoService()
    }()
    
    func makeAlbumFlowCoordinator(navigationController: UINavigationController) -> AlbumFlowCoordinator {
        return AlbumFlowCoordinator(navigationController: navigationController, dependencies: self, viewModel: makeLibraryViewModel(), photoService: photoService)
    }
}

extension AlbumDIContainer {
    func makePhotoRepository() -> PhotoRepository {
        return PhotoRepository(photoService: photoService)
    }
    
    func makeRequestPhotoAuthUsecase() -> RequestPhotoAuthUsecaseProtocol {
        return RequestPhotoAuthUsecase(photoRepository: makePhotoRepository())
    }
    
    func makeGetFetchingAssetsUsecase() -> GetFetchingAssetsUseCaseProtocol {
        return GetFetchingAssetsUseCase(photoRepository: makePhotoRepository())
    }
    
    func makeLibraryViewModel() -> AlbumViewModel {
        AlbumViewModel(requestPhotoAuthUsecase: makeRequestPhotoAuthUsecase(), getFetchingAssetsUsecase: makeGetFetchingAssetsUsecase())
    }
}
