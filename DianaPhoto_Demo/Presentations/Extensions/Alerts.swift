import UIKit

extension UIAlertController {
    static func photoAuthAlert(title: String) -> Self {
        let alert = Self.init(title: title, message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default) { _ in
            if let appSettings = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSettings, options: [:], completionHandler: nil)
            }
        }
        
        alert.addAction(ok)
        
        return alert
    }
    
    static func photoDeleteAlert(action: @escaping () -> ()) -> Self {
        let alert = Self.init(title: "이미지를 삭제하시겠습니까?", message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default) { _ in
            action()
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        return alert
    }
}
