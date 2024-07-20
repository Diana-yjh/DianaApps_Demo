import UIKit

class TabBarFlowCoordinator: FlowCoordinator {
    var navigationController: UINavigationController
    
    var tabBarController: UITabBarController
    
    private let dependencies: TabBarDIContainerProtocol
    
    required init(navigationController: UINavigationController, dependencies: TabBarDIContainerProtocol) {
        self.navigationController = navigationController
        self.dependencies = dependencies
        self.tabBarController = .init()
    }
    
    func start() {
        let pages: [TabBarPage] = [.library, .forYou, .album].sorted(by: { $0.pageOrderNumber() < $1.pageOrderNumber() })
        
        let controllers: [UINavigationController] = pages.map({ getTabController($0) })
        
        prepareTabBarController(withTabControllers: controllers)
    }
    
    private func prepareTabBarController(withTabControllers tabControllers: [UIViewController]) {
        tabBarController.setViewControllers(tabControllers, animated: true)
        tabBarController.selectedIndex = TabBarPage.library.pageOrderNumber()
        tabBarController.tabBar.isTranslucent = true
        tabBarController.tabBar.backgroundColor = UIColor(white: 1.0, alpha: 0.8)
        
        navigationController.viewControllers = [tabBarController]
    }
    
    private func getTabController(_ page: TabBarPage) -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.setNavigationBarHidden(false, animated: true)
        
        navigationController.tabBarItem = UITabBarItem.init(title: page.pageTitleValue(),
                                                     image: page.pageImageName(),
                                                     tag: page.pageOrderNumber())
        
        switch page {
        case .library:
            let libraryFlowCoordinator = LibraryDIContainer().makeLibraryFlowCoordinator(navigationController: navigationController)
            libraryFlowCoordinator.start()
        case .forYou:
            let forYou = ForYouViewController()
//            navigationController.pushViewController(forYou, animated: true)
        case .album:
            let albumFlowCoordinator = AlbumDIContainer().makeAlbumFlowCoordinator(navigationController: navigationController)
            albumFlowCoordinator.start()
//            navigationController.pushViewController(album, animated: true)
        }
        return navigationController
    }
}
