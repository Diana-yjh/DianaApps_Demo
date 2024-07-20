import UIKit

class AlbumViewController: UIViewController {
    
    var viewModel: AlbumViewModel
    var coordinator: AlbumFlowCoordinator?
    
    init(viewModel: AlbumViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = TabBarPage.pageTitleValue(.album)()
    }
}
