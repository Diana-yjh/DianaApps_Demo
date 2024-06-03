import SwiftUI
import KakaoMapsSDK

@main
struct DianaMap_DemoApp: App {
    init() {
        SDKInitializer.InitSDK(appKey: "My App Key")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
