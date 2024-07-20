protocol RequestPhotoAuthUsecaseProtocol {
    var photoRepository: PhotoRepositoryProtocol { get }
    
    func execute() async -> Result<Void?, PhotoAuthError>
}

class RequestPhotoAuthUsecase: RequestPhotoAuthUsecaseProtocol {
    var photoRepository: any PhotoRepositoryProtocol
    
    init(photoRepository: any PhotoRepositoryProtocol) {
        self.photoRepository = photoRepository
    }
    
    func execute() async -> Result<Void?, PhotoAuthError> {
        return await photoRepository.requestPhotoAuthorization()
    }
}
