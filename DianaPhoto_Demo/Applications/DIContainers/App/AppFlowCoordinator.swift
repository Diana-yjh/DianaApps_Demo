import UIKit

protocol FlowCoordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}

final class AppFlowCoordinator: FlowCoordinator {
    var navigationController: UINavigationController
    
    private let appDIContainer: AppDIContainer
    
    init(navigationController: UINavigationController, appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }
    
    func start() {
        let tabBarDIContainer = appDIContainer.makeTabBarDIContainer()
        let flow = tabBarDIContainer.makeTabBarFlowCoordinator(navigationController: navigationController)
        flow.start()
    }
}

