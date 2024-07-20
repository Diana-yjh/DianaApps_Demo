import Photos

struct PhotoRepository: PhotoRepositoryProtocol {
    var photoService: PhotoServiceProtocol
    
    init(photoService: PhotoServiceProtocol) {
        self.photoService = photoService
    }
    
    func requestPhotoAuthorization() async -> Result<Void?, PhotoAuthError> {
        return await photoService.requestAuthorization()
    }
    
    func getFetchingAssets() -> PHFetchResult<PHAsset> {
        return photoService.getFetchingAssets()
    }
    
    func deleteSelectedAsset(asset: PHAsset) {
        photoService.deleteSelectedAsset(asset: asset)
    }
}
