import UIKit

protocol TabBarDIContainerProtocol {
    func makeTabBarFlowCoordinator(navigationController: UINavigationController) -> TabBarFlowCoordinator
}

class TabBarDIContainer: TabBarDIContainerProtocol {
    lazy var photoService: PhotoService = {
        return PhotoService()
    }()
    
    func makeTabBarFlowCoordinator(navigationController: UINavigationController) -> TabBarFlowCoordinator {
        return TabBarFlowCoordinator(navigationController: navigationController, dependencies: self)
    }
}
