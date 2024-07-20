import Photos
import UIKit

class AlbumViewModel: ObservableObject {
    private var requestPhotoAuthUsecase: RequestPhotoAuthUsecaseProtocol
    private var getFetchingAssetsUsecase: GetFetchingAssetsUseCaseProtocol
    
    var photoAuthorizationError: PhotoAuthError?
    var assets: PHFetchResult<PHAsset>?
    
    init(requestPhotoAuthUsecase: RequestPhotoAuthUsecaseProtocol, getFetchingAssetsUsecase: GetFetchingAssetsUseCaseProtocol) {
        self.requestPhotoAuthUsecase = requestPhotoAuthUsecase
        self.getFetchingAssetsUsecase = getFetchingAssetsUsecase
    }
    
    func requestPhotoAuthorization() async {
        let photoAuthorization = await requestPhotoAuthUsecase.execute()
        
        switch photoAuthorization {
        case .success(_):
            photoAuthorizationError = nil
        case .failure(let failure):
            photoAuthorizationError = failure
        }
    }
    
    func getFetchingAssets() {
        assets = getFetchingAssetsUsecase.execute()
    }
    
    func getchAssetToImage(indexPath: IndexPath, completion: @escaping (UIImage) -> ()) {
        let imageManager = PHImageManager()
        imageManager.requestImage(for: assets!.object(at: indexPath.item), targetSize: .zero, contentMode: .aspectFill, options: nil) { image, _ in
            completion(image!)
        }
    }
}
