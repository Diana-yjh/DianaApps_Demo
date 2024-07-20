import Photos

protocol PhotoRepositoryProtocol {
    var photoService: PhotoServiceProtocol { get }
    
    func requestPhotoAuthorization() async -> Result<Void?, PhotoAuthError>
    func getFetchingAssets() -> PHFetchResult<PHAsset>
    func deleteSelectedAsset(asset: PHAsset)
}
