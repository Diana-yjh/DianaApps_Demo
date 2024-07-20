import UIKit
import Photos

class AlbumFlowCoordinator: FlowCoordinator {
    var navigationController: UINavigationController
     
    private let dependencies: AlbumDIContainerProtocol
    
    var photoService: PhotoService
    
    var viewModel: AlbumViewModel
    
    init(navigationController: UINavigationController,
         dependencies: AlbumDIContainerProtocol,
         viewModel: AlbumViewModel,
         photoService: PhotoService) {
        self.navigationController = navigationController
        self.dependencies = dependencies
        self.viewModel = viewModel
        self.photoService = photoService
    }

    func start() {
        let album = AlbumViewController(viewModel: viewModel)
        album.coordinator = self
        navigationController.pushViewController(album, animated: true)
    }
}
