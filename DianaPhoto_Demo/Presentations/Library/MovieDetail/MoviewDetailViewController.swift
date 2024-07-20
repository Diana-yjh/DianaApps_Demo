import UIKit
import Photos

class VideoDetailViewController: UIViewController {
    var asset: AVURLAsset?
    
    var videoPlayer: AVPlayer? = nil
    var videoPlayerLayer: AVPlayerLayer? = nil
    
    var videoView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = false
        scrollView.alwaysBounceVertical = false
        
        scrollView.maximumZoomScale = 5
        scrollView.minimumZoomScale = 1
        
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        setConstraint()
        prepareVideo()
        
        scrollView.delegate = self
    }
    
    func setConstraint() {
        
    }
    
    func prepareVideo() {
        guard let url = asset?.url else { return }
    
        videoPlayer = AVPlayer(url: url)
        
        let playerLayer = AVPlayerLayer(player: videoPlayer)
        playerLayer.frame = self.videoView.frame
        view.layer.addSublayer(playerLayer)
    }
}

extension VideoDetailViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return videoView
    }
}
