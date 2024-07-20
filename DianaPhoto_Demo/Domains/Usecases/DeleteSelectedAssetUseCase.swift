import Photos

protocol DeleteSelectedAssetUseCaseProtocol {
    var photoRepository: PhotoRepositoryProtocol { get }
    
    func execute(asset: PHAsset)
}

class DeleteSelectedAssetUseCase: DeleteSelectedAssetUseCaseProtocol {
    var photoRepository: any PhotoRepositoryProtocol
    
    init(photoRepository: any PhotoRepositoryProtocol) {
        self.photoRepository = photoRepository
    }
    
    func execute(asset: PHAsset) {
        return photoRepository.deleteSelectedAsset(asset: asset)
    }
}

