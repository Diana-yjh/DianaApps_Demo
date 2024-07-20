import Photos

enum PhotoAuthError: Error {
    case deniedError
    case limitiedError
    case notDeterminedError
    case unknownError
    
    var errorTitle: String {
        switch self {
        case .deniedError:
            return "필수 권한이 거절되었습니다. \n[설정] -> [앱]에서 필수 권한을 체크해주세요."
        case .limitiedError:
            return "필수 권한이 제한되었습니다. \n[설정] -> [앱]에서 필수 권한을 체크해주세요."
        case .notDeterminedError:
            return "필수 권한 설정이 필요합니다. \n[설정] -> [앱]에서 필수 권한을 체크해주세요."
        case .unknownError:
            return "오류가 발생하였습니다. \n권한을 체크해주세요."
        }
    }
    
    var authStatus: PHAuthorizationStatus {
        switch self {
        case .deniedError:
            return .denied
        case .limitiedError:
            return .limited
        case .notDeterminedError:
            return .notDetermined
        case .unknownError:
            return .restricted
        }
    }
}
