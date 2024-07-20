import Photos

protocol PhotoServiceProtocol {
    var authorizationStatus: PHAuthorizationStatus { get }
    
    func requestAuthorization() async -> Result<Void?, PhotoAuthError>
    func getFetchingAssets() -> PHFetchResult<PHAsset>
    func deleteSelectedAsset(asset: PHAsset)
}

final class PhotoService: PhotoServiceProtocol {
    var authorizationStatus: PHAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
    
    func requestAuthorization() async -> Result<Void?, PhotoAuthError> {
        let status = await withCheckedContinuation { continuation in
            PHPhotoLibrary.requestAuthorization { newStatus in
                continuation.resume(returning: newStatus)
            }
        }
        
        switch status {
        case .authorized:
            return .success(nil)
        case .notDetermined:
            return .failure(.notDeterminedError)
        case .denied, .restricted:
            return .failure(.deniedError)
        case .limited:
            return .failure(.limitiedError)
        @unknown default:
            return .failure(.unknownError)
        }
    }
    
    func getFetchingAssets() -> PHFetchResult<PHAsset> {
        let phFetchOptions = PHFetchOptions()
        phFetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        let asset = PHAsset.fetchAssets(with: phFetchOptions)
        
        return asset
    }
    
    func deleteSelectedAsset(asset: PHAsset) {
        PHPhotoLibrary.shared().performChanges({PHAssetChangeRequest.deleteAssets([asset] as NSArray)}, completionHandler: nil)
    }
}
