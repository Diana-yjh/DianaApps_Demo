import UIKit
import Photos

class LibraryFlowCoordinator: FlowCoordinator {
    var navigationController: UINavigationController
     
    private let dependencies: LibraryDIContainerProtocol
    
    var photoService: PhotoService
    
    var viewModel: LibraryViewModel
    
    init(navigationController: UINavigationController,
         dependencies: LibraryDIContainerProtocol,
         viewModel: LibraryViewModel,
         photoService: PhotoService) {
        self.navigationController = navigationController
        self.dependencies = dependencies
        self.viewModel = viewModel
        self.photoService = photoService
    }

    func start() {
        let library = LibraryViewController(viewModel: viewModel)
        library.coordinator = self
        navigationController.pushViewController(library, animated: true)
    }
    
    func moveToPhotoDetail(asset: UIImage) {
        let photoDetail = PhotoDetailViewController()
        photoDetail.asset = asset
        navigationController.pushViewController(photoDetail, animated: true)
    }
    
    func moveToVideoDetail(asset: AVURLAsset) {
        DispatchQueue.main.async {
            let videoDetail = VideoDetailViewController()
            videoDetail.asset = asset
            self.navigationController.pushViewController(videoDetail, animated: true)
        }
    }
}
