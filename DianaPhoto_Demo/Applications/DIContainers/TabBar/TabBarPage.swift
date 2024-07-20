import UIKit

enum TabBarPage {
    case library
    case forYou
    case album

    init?(index: Int) {
        switch index {
        case 0:
            self = .library
        case 1:
            self = .forYou
        case 2:
            self = .album
        default:
            return nil
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .library:
            return "Library"
        case .forYou:
            return "ForYou"
        case .album:
            return "Album"
        }
    }

    func pageImageName() -> UIImage {
        switch self {
        case .library:
            return UIImage(systemName: "photo.fill.on.rectangle.fill") ?? UIImage()
        case .forYou:
            return UIImage(systemName: "heart.text.square.fill") ?? UIImage()
        case .album:
            return UIImage(systemName: "rectangle.stack.fill") ?? UIImage()
        }
    }
    
    func pageOrderNumber() -> Int {
        switch self {
        case .library:
            return 0
        case .forYou:
            return 1
        case .album:
            return 2
        }
    }
}
