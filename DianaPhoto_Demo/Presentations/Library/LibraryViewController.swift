import UIKit
import Photos

class LibraryViewController: UIViewController {
    private var viewModel: LibraryViewModel
    private var photoAuthorizationStatus: PhotoAuthError?
    
    var coordinator: LibraryFlowCoordinator?
    
    private let flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        return flowLayout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(LibraryCollectionViewCell.self, forCellWithReuseIdentifier: LibraryCollectionViewCell.IDENTIFIER)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    init(viewModel: LibraryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = TabBarPage.pageTitleValue(.library)()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        Task {
            await viewModel.requestPhotoAuthorization()
            
            if let error = viewModel.photoAuthorizationError {
                let alert = UIAlertController.photoAuthAlert(title: error.errorTitle)
                self.present(alert, animated: true)
            }
            
            viewModel.getFetchingAssets()
            setCollectionViewConstraint()
        }
    }
    
    func setCollectionViewConstraint() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension LibraryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let assets = viewModel.assets else {
            return 0
        }
        
        return assets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LibraryCollectionViewCell.IDENTIFIER, for: indexPath) as? LibraryCollectionViewCell else { return UICollectionViewCell()}
        let imageManager = PHImageManager()
        
        guard let assets = viewModel.assets else { return UICollectionViewCell() }
        
        let imageSize = CGSize(width: CellConstant.cellSize.width * CellConstant.scale, height: CellConstant.cellSize.height * CellConstant.scale)
        
        cell.representIdentifier = assets.object(at: indexPath.item).localIdentifier
        
        imageManager.requestImage(for: assets.object(at: indexPath.item), targetSize: imageSize, contentMode: .aspectFill, options: nil, resultHandler: { image, _ in
            guard let assetImage = image else { return }
            if cell.representIdentifier == assets.object(at: indexPath.item).localIdentifier {
                cell.prepare(image: assetImage)
            }
        })
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageManager = PHImageManager()
        let imageOption = PHImageRequestOptions()
        imageOption.isSynchronous = true
        
        guard let assets = viewModel.assets else { return }
        
        let imageSize = CGSize(width: CellConstant.cellSize.width * CellConstant.scale, height: CellConstant.cellSize.height * CellConstant.scale)
        
        if assets.object(at: indexPath.item).mediaType == .image {
            imageManager.requestImage(for: assets.object(at: indexPath.item), targetSize: imageSize, contentMode: .aspectFill, options: imageOption, resultHandler: { image, _ in
                self.coordinator?.moveToPhotoDetail(asset: image!)
            })
        } else if assets.object(at: indexPath.item).mediaType == .video {
            imageManager.requestAVAsset(forVideo: assets.object(at: indexPath.item), options: nil) { assets, _, _ in
                self.coordinator?.moveToVideoDetail(asset: assets as! AVURLAsset)
            }
        }
    }
}

extension LibraryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CellConstant.cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}

extension LibraryViewController: UICollectionViewDelegate {}
