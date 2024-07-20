import Photos

protocol GetFetchingAssetsUseCaseProtocol {
    var photoRepository: PhotoRepositoryProtocol { get }
    
    func execute() -> PHFetchResult<PHAsset>
}

class GetFetchingAssetsUseCase: GetFetchingAssetsUseCaseProtocol {
    var photoRepository: any PhotoRepositoryProtocol
    
    init(photoRepository: any PhotoRepositoryProtocol) {
        self.photoRepository = photoRepository
    }
    
    func execute() -> PHFetchResult<PHAsset> {
        return photoRepository.getFetchingAssets()
    }
}
