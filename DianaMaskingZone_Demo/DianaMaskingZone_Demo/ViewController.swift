import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var privacyView: UIView!
    
    @IBOutlet weak var getImageBtn: UIButton!
    @IBOutlet weak var changeBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var endBtn: UIButton!
    
    var maskingZone1 = UIView()
    var maskingZone2 = UIView()
    var maskingZone3 = UIView()
    var maskingZone4 = UIView()
    
    var gesture1 = UIPanGestureRecognizer()
    var gesture2 = UIPanGestureRecognizer()
    var gesture3 = UIPanGestureRecognizer()
    var gesture4 = UIPanGestureRecognizer()
    
    var expandGesture1 = UIPanGestureRecognizer()
    var expandGesture2 = UIPanGestureRecognizer()
    var expandGesture3 = UIPanGestureRecognizer()
    var expandGesture4 = UIPanGestureRecognizer()
        
    var resizeGesture1 = UIPanGestureRecognizer()
    var resizeGesture2 = UIPanGestureRecognizer()
    var resizeGesture3 = UIPanGestureRecognizer()
    var resizeGesture4 = UIPanGestureRecognizer()
    
    var tap1 = UITapGestureRecognizer()
    var tap2 = UITapGestureRecognizer()
    var tap3 = UITapGestureRecognizer()
    var tap4 = UITapGestureRecognizer()
    
    var deleteBtn1 = UIButton()
    var deleteBtn2 = UIButton()
    var deleteBtn3 = UIButton()
    var deleteBtn4 = UIButton()
    
    var expandBtn1 = UIButton()
    var expandBtn2 = UIButton()
    var expandBtn3 = UIButton()
    var expandBtn4 = UIButton()
    
    var resultArr = [Int]()
    var totalArr = [Int]()
    var borderLayer = CAShapeLayer()
    var index: Int = 0
    var defaultX: CGFloat = 0
    var defaultY: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultArr = [0, 1, 2, 3]
        self.totalArr = [0, 1, 2, 3]
        
        self.endBtn.isHidden = true
        
        self.getImageBtn.layer.cornerRadius = 5
        self.changeBtn.layer.cornerRadius = 5
        self.addBtn.layer.cornerRadius = 5
        self.resetBtn.layer.cornerRadius = 5
        self.privacyView.layer.cornerRadius = 5
        
        let viewTap = UITapGestureRecognizer(target: self, action: #selector(didTapView(_:)))
        self.privacyView.addGestureRecognizer(viewTap)
    }
    
    func checkMaskingArr() -> Int {
        var result = 0
        var index = 0
        if totalArr.count > 0 {
            result = (totalArr.randomElement()) ?? 0
            index = totalArr.firstIndex(of: result)!
            totalArr.remove(at: index)
        } else {
            //alert 띄우기
            return -1
        }
        
        return result
    }
    
    @IBAction func getImageBtn(_ sender: Any) {
        
    }
    
    @IBAction func changeBtn(_ sender: Any) {
        self.firstView.isHidden = true
        self.endBtn.isHidden = false
        self.maskingZone1.addGestureRecognizer(tap1)
        self.maskingZone1.addGestureRecognizer(gesture1)
        self.maskingZone2.addGestureRecognizer(tap2)
        self.maskingZone2.addGestureRecognizer(gesture2)
        self.maskingZone3.addGestureRecognizer(tap3)
        self.maskingZone3.addGestureRecognizer(gesture3)
        self.maskingZone4.addGestureRecognizer(tap4)
        self.maskingZone4.addGestureRecognizer(gesture4)
    }
    
    @IBAction func addBtn(_ sender: Any) {
        self.index = checkMaskingArr()
        
        if self.index == -1 {
            return
        }
        self.setMaskingView(index: self.index)
    }
    
    @IBAction func resetBtn(_ sender: Any) {
        self.index = 0
        self.totalArr = [0, 1, 2, 3]
        
        self.deleteBtn1.removeFromSuperview()
        self.deleteBtn2.removeFromSuperview()
        self.deleteBtn3.removeFromSuperview()
        self.deleteBtn4.removeFromSuperview()
        
        self.expandBtn1.removeFromSuperview()
        self.expandBtn2.removeFromSuperview()
        self.expandBtn3.removeFromSuperview()
        self.expandBtn4.removeFromSuperview()
        
        self.maskingZone1.removeFromSuperview()
        self.maskingZone2.removeFromSuperview()
        self.maskingZone3.removeFromSuperview()
        self.maskingZone4.removeFromSuperview()
    }
    
    @IBAction func endBtn(_ sender: Any) {
        self.endBtn.isHidden = true
        self.firstView.isHidden = false
        self.borderLayer.removeFromSuperlayer()
        
        self.deleteBtn1.removeFromSuperview()
        self.deleteBtn2.removeFromSuperview()
        self.deleteBtn3.removeFromSuperview()
        self.deleteBtn4.removeFromSuperview()
        
        self.expandBtn1.removeFromSuperview()
        self.expandBtn2.removeFromSuperview()
        self.expandBtn3.removeFromSuperview()
        self.expandBtn4.removeFromSuperview()
        
        self.maskingZone1.removeGestureRecognizer(tap1)
        self.maskingZone2.removeGestureRecognizer(tap2)
        self.maskingZone3.removeGestureRecognizer(tap3)
        self.maskingZone4.removeGestureRecognizer(tap4)
        
        self.maskingZone1.removeGestureRecognizer(gesture1)
        self.maskingZone2.removeGestureRecognizer(gesture2)
        self.maskingZone3.removeGestureRecognizer(gesture3)
        self.maskingZone4.removeGestureRecognizer(gesture4)
        
        let result = resultArr.filter{!totalArr.contains($0)}
        
        if result.count == 0 {
            return
        }
        
        for index in result {
            switch index {
            case 0:
                print("width = \(round(self.maskingZone1.frame.width)), height = \(round(self.maskingZone1.frame.height)), x = \(round(self.maskingZone1.frame.origin.x)), y = \(round(self.maskingZone1.frame.origin.y))")
            case 1:
                print("width = \(round(self.maskingZone2.frame.width)), height = \(round(self.maskingZone2.frame.height)), x = \(round(self.maskingZone2.frame.origin.x)), y = \(round(self.maskingZone2.frame.origin.y))")
            case 2:
                print("width = \(round(self.maskingZone3.frame.width)), height = \(round(self.maskingZone3.frame.height)), x = \(round(self.maskingZone3.frame.origin.x)), y = \(round(self.maskingZone3.frame.origin.y))")
            case 3:
                print("width = \(round(self.maskingZone4.frame.width)), height = \(round(self.maskingZone4.frame.height)), x = \(round(self.maskingZone4.frame.origin.x)), y = \(round(self.maskingZone4.frame.origin.y))")
            default:
                print("default")
            }
        }
    }
}

extension ViewController {
    //MARK: - Tap MaskingView Action
    @objc func tapMaskingView1(_ sender: UITapGestureRecognizer) {
        self.privacyView.addSubview(self.deleteBtn1)
        self.privacyView.addSubview(self.expandBtn1)
        
        self.privacyView.bringSubviewToFront(self.maskingZone1)
        self.privacyView.bringSubviewToFront(self.deleteBtn1)
        self.privacyView.bringSubviewToFront(self.expandBtn1)
        
        self.setBorderLayer(zone: self.maskingZone1)
        
        self.maskingZone1.addGestureRecognizer(gesture1)
        self.maskingZone2.removeGestureRecognizer(gesture2)
        self.maskingZone3.removeGestureRecognizer(gesture3)
        self.maskingZone4.removeGestureRecognizer(gesture4)
        
        self.deleteBtn2.removeFromSuperview()
        self.expandBtn2.removeFromSuperview()
        self.deleteBtn3.removeFromSuperview()
        self.expandBtn3.removeFromSuperview()
        self.deleteBtn4.removeFromSuperview()
        self.expandBtn4.removeFromSuperview()
    }
    
    @objc func tapMaskingView2(_ sender: UITapGestureRecognizer) {
        self.privacyView.addSubview(self.deleteBtn2)
        self.privacyView.addSubview(self.expandBtn2)
        
        self.privacyView.bringSubviewToFront(self.maskingZone2)
        self.privacyView.bringSubviewToFront(self.deleteBtn2)
        self.privacyView.bringSubviewToFront(self.expandBtn2)
        
        self.setBorderLayer(zone: self.maskingZone2)
        
        self.maskingZone2.addGestureRecognizer(gesture2)
        self.maskingZone1.removeGestureRecognizer(gesture1)
        self.maskingZone3.removeGestureRecognizer(gesture3)
        self.maskingZone4.removeGestureRecognizer(gesture4)

        self.deleteBtn1.removeFromSuperview()
        self.expandBtn1.removeFromSuperview()
        self.deleteBtn3.removeFromSuperview()
        self.expandBtn3.removeFromSuperview()
        self.deleteBtn4.removeFromSuperview()
        self.expandBtn4.removeFromSuperview()
    }
    
    @objc func tapMaskingView3(_ sender: UITapGestureRecognizer) {
        self.privacyView.addSubview(self.deleteBtn3)
        self.privacyView.addSubview(self.expandBtn3)
        
        self.privacyView.bringSubviewToFront(self.maskingZone3)
        self.privacyView.bringSubviewToFront(self.deleteBtn3)
        self.privacyView.bringSubviewToFront(self.expandBtn3)
        
        self.setBorderLayer(zone: self.maskingZone3)
        
        self.maskingZone3.addGestureRecognizer(gesture3)
        self.maskingZone2.removeGestureRecognizer(gesture2)
        self.maskingZone1.removeGestureRecognizer(gesture1)
        self.maskingZone4.removeGestureRecognizer(gesture4)

        self.deleteBtn2.removeFromSuperview()
        self.expandBtn2.removeFromSuperview()
        self.deleteBtn1.removeFromSuperview()
        self.expandBtn1.removeFromSuperview()
        self.deleteBtn4.removeFromSuperview()
        self.expandBtn4.removeFromSuperview()
    }
    
    @objc func tapMaskingView4(_ sender: UITapGestureRecognizer) {
        self.privacyView.addSubview(self.deleteBtn4)
        self.privacyView.addSubview(self.expandBtn4)
        
        self.privacyView.bringSubviewToFront(self.maskingZone4)
        self.privacyView.bringSubviewToFront(self.deleteBtn4)
        self.privacyView.bringSubviewToFront(self.expandBtn4)
        
        self.setBorderLayer(zone: self.maskingZone4)
        
        self.maskingZone4.addGestureRecognizer(gesture4)
        self.maskingZone2.removeGestureRecognizer(gesture2)
        self.maskingZone3.removeGestureRecognizer(gesture3)
        self.maskingZone1.removeGestureRecognizer(gesture1)

        self.deleteBtn2.removeFromSuperview()
        self.expandBtn2.removeFromSuperview()
        self.deleteBtn3.removeFromSuperview()
        self.expandBtn3.removeFromSuperview()
        self.deleteBtn1.removeFromSuperview()
        self.expandBtn1.removeFromSuperview()
    }
    
    //MARK: - Pan MaskingView Action
    @objc func panMaskingView1(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.privacyView)
        let x = self.maskingZone1.frame.origin.x
        let y = self.maskingZone1.frame.origin.y
        var xCenter: CGFloat = 0
        var yCenter: CGFloat = 0
        
        if x + translation.x < 0 {
            xCenter = self.maskingZone1.frame.width / 2
        } else if x + translation.x + self.maskingZone1.frame.width > self.privacyView.frame.width {
            xCenter = self.privacyView.frame.width - self.maskingZone1.frame.width / 2
        } else {
            xCenter = self.maskingZone1.center.x + translation.x
        }
        
        if y + translation.y < 0 {
            yCenter = self.maskingZone1.frame.height / 2
        } else if y + translation.y + self.maskingZone1.frame.height > self.privacyView.frame.height {
            yCenter = self.privacyView.frame.height - self.maskingZone1.frame.height / 2
        } else {
            yCenter = self.maskingZone1.center.y + translation.y
        }
        
        self.maskingZone1.center = CGPoint(x: xCenter, y: yCenter)
        self.deleteBtn1.frame = CGRect(x: self.maskingZone1.frame.origin.x - 25, y: self.maskingZone1.frame.origin.y - 25, width: 50, height: 50)
        self.expandBtn1.frame = CGRect(x: self.maskingZone1.frame.origin.x + self.maskingZone1.frame.width - 25, y: self.maskingZone1.frame.origin.y + self.maskingZone1.frame.height - 25, width: 50, height: 50)
        
        sender.setTranslation(.zero, in: self.privacyView)
    }
    
    @objc func panMaskingView2(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.privacyView)
        let x = self.maskingZone2.frame.origin.x
        let y = self.maskingZone2.frame.origin.y
        var xCenter: CGFloat = 0
        var yCenter: CGFloat = 0
        
        if x + translation.x < 0 {
            xCenter = self.maskingZone2.frame.width / 2
        } else if x + translation.x + self.maskingZone2.frame.width > self.privacyView.frame.width {
            xCenter = self.privacyView.frame.width - self.maskingZone2.frame.width / 2
        } else {
            xCenter = self.maskingZone2.center.x + translation.x
        }
        
        if y + translation.y < 0 {
            yCenter = self.maskingZone2.frame.height / 2
        } else if y + translation.y + self.maskingZone2.frame.height > self.privacyView.frame.height {
            yCenter = self.privacyView.frame.height - self.maskingZone2.frame.height / 2
        } else {
            yCenter = self.maskingZone2.center.y + translation.y
        }
        
        self.maskingZone2.center = CGPoint(x: xCenter, y: yCenter)
        self.deleteBtn2.frame = CGRect(x: self.maskingZone2.frame.origin.x - 25, y: self.maskingZone2.frame.origin.y - 25, width: 50, height: 50)
        self.expandBtn2.frame = CGRect(x: self.maskingZone2.frame.origin.x + self.maskingZone2.frame.width - 25, y: self.maskingZone2.frame.origin.y + self.maskingZone2.frame.height - 25, width: 50, height: 50)
        
        sender.setTranslation(.zero, in: self.privacyView)
    }
    
    @objc func panMaskingView3(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.privacyView)
        let x = self.maskingZone3.frame.origin.x
        let y = self.maskingZone3.frame.origin.y
        var xCenter: CGFloat = 0
        var yCenter: CGFloat = 0
        
        if x + translation.x < 0 {
            xCenter = self.maskingZone3.frame.width / 2
        } else if x + translation.x + self.maskingZone3.frame.width > self.privacyView.frame.width {
            xCenter = self.privacyView.frame.width - self.maskingZone3.frame.width / 2
        } else {
            xCenter = self.maskingZone3.center.x + translation.x
        }
        
        if y + translation.y < 0 {
            yCenter = self.maskingZone3.frame.height / 2
        } else if y + translation.y + self.maskingZone3.frame.height > self.privacyView.frame.height {
            yCenter = self.privacyView.frame.height - self.maskingZone3.frame.height / 2
        } else {
            yCenter = self.maskingZone3.center.y + translation.y
        }
        
        self.maskingZone3.center = CGPoint(x: xCenter, y: yCenter)
        self.deleteBtn3.frame = CGRect(x: self.maskingZone3.frame.origin.x - 25, y: self.maskingZone3.frame.origin.y - 25, width: 50, height: 50)
        self.expandBtn3.frame = CGRect(x: self.maskingZone3.frame.origin.x + self.maskingZone3.frame.width - 25, y: self.maskingZone3.frame.origin.y + self.maskingZone3.frame.height - 25, width: 50, height: 50)
        
        sender.setTranslation(.zero, in: self.privacyView)
    }
    
    @objc func panMaskingView4(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.privacyView)
        let x = self.maskingZone4.frame.origin.x
        let y = self.maskingZone4.frame.origin.y
        var xCenter: CGFloat = 0
        var yCenter: CGFloat = 0
        
        if x + translation.x < 0 {
            xCenter = self.maskingZone4.frame.width / 2
        } else if x + translation.x + self.maskingZone4.frame.width > self.privacyView.frame.width {
            xCenter = self.privacyView.frame.width - self.maskingZone4.frame.width / 2
        } else {
            xCenter = self.maskingZone4.center.x + translation.x
        }
        
        if y + translation.y < 0 {
            yCenter = self.maskingZone4.frame.height / 2
        } else if y + translation.y + self.maskingZone4.frame.height > self.privacyView.frame.height {
            yCenter = self.privacyView.frame.height - self.maskingZone4.frame.height / 2
        } else {
            yCenter = self.maskingZone4.center.y + translation.y
        }
        
        self.maskingZone4.center = CGPoint(x: xCenter, y: yCenter)
        self.deleteBtn4.frame = CGRect(x: self.maskingZone4.frame.origin.x - 25, y: self.maskingZone4.frame.origin.y - 25, width: 50, height: 50)
        self.expandBtn4.frame = CGRect(x: self.maskingZone4.frame.origin.x + self.maskingZone4.frame.width - 25, y: self.maskingZone4.frame.origin.y + self.maskingZone4.frame.height - 25, width: 50, height: 50)
        
        sender.setTranslation(.zero, in: self.privacyView)
    }
    
    //MARK: - Delete Button Action
    @objc func deleteView1(_ sender: UITapGestureRecognizer) {
        self.totalArr.append(0)
        self.maskingZone1.removeFromSuperview()
        self.deleteBtn1.removeFromSuperview()
        self.expandBtn1.removeFromSuperview()
    }
    
    @objc func deleteView2(_ sender: UITapGestureRecognizer) {
        self.totalArr.append(1)
        self.maskingZone2.removeFromSuperview()
        self.deleteBtn2.removeFromSuperview()
        self.expandBtn2.removeFromSuperview()
    }
    
    @objc func deleteView3(_ sender: UITapGestureRecognizer) {
        self.totalArr.append(2)
        self.maskingZone3.removeFromSuperview()
        self.deleteBtn3.removeFromSuperview()
        self.expandBtn3.removeFromSuperview()
    }
    
    @objc func deleteView4(_ sender: UITapGestureRecognizer) {
        self.totalArr.append(3)
        self.maskingZone4.removeFromSuperview()
        self.deleteBtn4.removeFromSuperview()
        self.expandBtn4.removeFromSuperview()
    }
    
    //MARK: - Expand Button Action
    @objc func expandView1(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.privacyView)

        let maskTopLftX = self.maskingZone1.frame.origin.x
        let maskTopLftY = self.maskingZone1.frame.origin.y

        var width: CGFloat = 0
        var height: CGFloat = 0
        if self.maskingZone1.frame.width + translation.x < 0 {
            width = 0
        } else if self.maskingZone1.frame.origin.x + self.maskingZone1.frame.width + translation.x > self.privacyView.frame.width {
            width = self.privacyView.frame.width - maskTopLftX
        } else {
            width = self.maskingZone1.frame.width + translation.x
        }

        if self.maskingZone1.frame.height + translation.y < 0 {
            height = 0
        } else if self.maskingZone1.frame.origin.y + self.maskingZone1.frame.height + translation.y > self.privacyView.frame.height {
            height = self.privacyView.frame.height - maskTopLftY
        } else {
            height = self.maskingZone1.frame.height + translation.y
        }

        self.maskingZone1.frame = CGRect(x: maskTopLftX, y: maskTopLftY, width: width, height: height)
        self.expandBtn1.frame = CGRect(x: maskTopLftX + self.maskingZone1.frame.width - 25, y: maskTopLftY + self.maskingZone1.frame.height - 25, width: 50, height: 50)
        self.borderLayer.path = UIBezierPath(roundedRect: self.maskingZone1.bounds, cornerRadius: 0).cgPath
        sender.setTranslation(.zero, in: self.privacyView)
    }
    
    @objc func expandView2(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.privacyView)

        let maskTopLftX = self.maskingZone2.frame.origin.x
        let maskTopLftY = self.maskingZone2.frame.origin.y

        var width: CGFloat = 0
        var height: CGFloat = 0
        if self.maskingZone2.frame.width + translation.x < 0 {
            width = 0
        } else if self.maskingZone2.frame.origin.x + self.maskingZone2.frame.width + translation.x > self.privacyView.frame.width {
            width = self.privacyView.frame.width - maskTopLftX
        } else {
            width = self.maskingZone2.frame.width + translation.x
        }

        if self.maskingZone2.frame.height + translation.y < 0 {
            height = 0
        } else if self.maskingZone2.frame.origin.y + self.maskingZone2.frame.height + translation.y > self.privacyView.frame.height {
            height = self.privacyView.frame.height - maskTopLftY
        } else {
            height = self.maskingZone2.frame.height + translation.y
        }

        self.maskingZone2.frame = CGRect(x: maskTopLftX, y: maskTopLftY, width: width, height: height)
        self.expandBtn2.frame = CGRect(x: maskTopLftX + self.maskingZone2.frame.width - 25, y: maskTopLftY + self.maskingZone2.frame.height - 25, width: 50, height: 50)
        self.borderLayer.path = UIBezierPath(roundedRect: self.maskingZone2.bounds, cornerRadius: 0).cgPath
        sender.setTranslation(.zero, in: self.privacyView)
    }
    
    @objc func expandView3(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.privacyView)

        let maskTopLftX = self.maskingZone3.frame.origin.x
        let maskTopLftY = self.maskingZone3.frame.origin.y

        var width: CGFloat = 0
        var height: CGFloat = 0
        if self.maskingZone3.frame.width + translation.x < 0 {
            width = 0
        } else if self.maskingZone3.frame.origin.x + self.maskingZone3.frame.width + translation.x > self.privacyView.frame.width {
            width = self.privacyView.frame.width - maskTopLftX
        } else {
            width = self.maskingZone3.frame.width + translation.x
        }

        if self.maskingZone3.frame.height + translation.y < 0 {
            height = 0
        } else if self.maskingZone3.frame.origin.y + self.maskingZone3.frame.height + translation.y > self.privacyView.frame.height {
            height = self.privacyView.frame.height - maskTopLftY
        } else {
            height = self.maskingZone3.frame.height + translation.y
        }

        self.maskingZone3.frame = CGRect(x: maskTopLftX, y: maskTopLftY, width: width, height: height)
        self.expandBtn3.frame = CGRect(x: maskTopLftX + self.maskingZone3.frame.width - 25, y: maskTopLftY + self.maskingZone3.frame.height - 25, width: 50, height: 50)
        self.borderLayer.path = UIBezierPath(roundedRect: self.maskingZone3.bounds, cornerRadius: 0).cgPath
        sender.setTranslation(.zero, in: self.privacyView)
    }
    
    @objc func expandView4(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.privacyView)

        let maskTopLftX = self.maskingZone4.frame.origin.x
        let maskTopLftY = self.maskingZone4.frame.origin.y

        var width: CGFloat = 0
        var height: CGFloat = 0
        if self.maskingZone4.frame.width + translation.x < 0 {
            width = 0
        } else if self.maskingZone4.frame.origin.x + self.maskingZone4.frame.width + translation.x > self.privacyView.frame.width {
            width = self.privacyView.frame.width - maskTopLftX
        } else {
            width = self.maskingZone4.frame.width + translation.x
        }

        if self.maskingZone4.frame.height + translation.y < 0 {
            height = 0
        } else if self.maskingZone4.frame.origin.y + self.maskingZone4.frame.height + translation.y > self.privacyView.frame.height {
            height = self.privacyView.frame.height - maskTopLftY
        } else {
            height = self.maskingZone4.frame.height + translation.y
        }

        self.maskingZone4.frame = CGRect(x: maskTopLftX, y: maskTopLftY, width: width, height: height)
        self.expandBtn4.frame = CGRect(x: maskTopLftX + self.maskingZone4.frame.width - 25, y: maskTopLftY + self.maskingZone4.frame.height - 25, width: 50, height: 50)
        self.borderLayer.path = UIBezierPath(roundedRect: self.maskingZone4.bounds, cornerRadius: 0).cgPath
        sender.setTranslation(.zero, in: self.privacyView)
    }
    
    //MARK: - Tap PrivacyView Action
    @objc func didTapView(_ sender: UITapGestureRecognizer) {
        self.borderLayer.removeFromSuperlayer()
        
        self.deleteBtn1.removeFromSuperview()
        self.deleteBtn2.removeFromSuperview()
        self.deleteBtn3.removeFromSuperview()
        self.deleteBtn4.removeFromSuperview()
        
        self.expandBtn1.removeFromSuperview()
        self.expandBtn2.removeFromSuperview()
        self.expandBtn3.removeFromSuperview()
        self.expandBtn4.removeFromSuperview()
        
        self.maskingZone1.removeGestureRecognizer(gesture1)
        self.maskingZone2.removeGestureRecognizer(gesture2)
        self.maskingZone3.removeGestureRecognizer(gesture3)
        self.maskingZone4.removeGestureRecognizer(gesture4)
    }
}

extension ViewController {
    func setBorderLayer(zone: UIView) {
        self.borderLayer.strokeColor = UIColor.systemGray3.cgColor
        self.borderLayer.lineDashPattern = [6, 2]
        self.borderLayer.lineWidth = 2
        self.borderLayer.frame = zone.bounds
        self.borderLayer.fillColor = nil
        self.borderLayer.path = UIBezierPath(roundedRect: zone.bounds, cornerRadius: 0).cgPath
        
        zone.layer.addSublayer(self.borderLayer)
    }
    
    func setBtnUI1() {
        deleteBtn1.frame = CGRect(x: self.maskingZone1.frame.origin.x - 25, y: self.maskingZone1.frame.origin.y - 25, width: 50, height: 50)
        deleteBtn1.tintColor = .systemGray2
        deleteBtn1.backgroundColor = .clear
        deleteBtn1.setImage(UIImage(systemName: "multiply.circle.fill"), for: .normal)
        deleteBtn1.addTarget(self, action: #selector(deleteView1(_:)), for: .touchUpInside)
        self.privacyView.addSubview(self.deleteBtn1)
        
        expandBtn1.frame = CGRect(x: self.maskingZone1.frame.origin.x + self.maskingZone1.frame.width - 25, y: self.maskingZone1.frame.origin.y + self.maskingZone1.frame.height - 25, width: 50, height: 50)
        expandBtn1.tintColor = .systemGray2
        expandBtn1.setImage(UIImage(systemName: "arrow.up.left.and.arrow.down.right.circle.fill"), for: .normal)
        self.privacyView.addSubview(self.expandBtn1)
        
        self.expandGesture1 = UIPanGestureRecognizer(target: self, action: #selector(expandView1(_:)))
        self.expandBtn1.addGestureRecognizer(expandGesture1)
    }
    
    func setBtnUI2(){
        deleteBtn2.frame = CGRect(x: self.maskingZone2.frame.origin.x - 25, y: self.maskingZone2.frame.origin.y - 25, width: 50, height: 50)
        deleteBtn2.tintColor = .systemGray2
        deleteBtn2.setImage(UIImage(systemName: "multiply.circle.fill"), for: .normal)
        deleteBtn2.addTarget(self, action: #selector(deleteView2(_:)), for: .touchUpInside)
        self.privacyView.addSubview(self.deleteBtn2)
        
        expandBtn2.frame = CGRect(x: self.maskingZone2.frame.origin.x + self.maskingZone2.frame.width - 25, y: self.maskingZone2.frame.origin.y + self.maskingZone2.frame.height - 25, width: 50, height: 50)
        expandBtn2.tintColor = .systemGray2
        expandBtn2.setImage(UIImage(systemName: "arrow.up.left.and.arrow.down.right.circle.fill"), for: .normal)
        self.privacyView.addSubview(self.expandBtn2)
        
        self.expandGesture2 = UIPanGestureRecognizer(target: self, action: #selector(expandView2(_:)))
        self.expandBtn2.addGestureRecognizer(expandGesture2)
    }
    
    func setBtnUI3(){
        deleteBtn3.frame = CGRect(x: self.maskingZone3.frame.origin.x - 25, y: self.maskingZone3.frame.origin.y - 25, width: 50, height: 50)
        deleteBtn3.tintColor = .systemGray2
        deleteBtn3.setImage(UIImage(systemName: "multiply.circle.fill"), for: .normal)
        deleteBtn3.addTarget(self, action: #selector(deleteView3(_:)), for: .touchUpInside)
        self.privacyView.addSubview(self.deleteBtn3)
        
        expandBtn3.frame = CGRect(x: self.maskingZone3.frame.origin.x + self.maskingZone3.frame.width - 25, y: self.maskingZone3.frame.origin.y + self.maskingZone3.frame.height - 25, width: 50, height: 50)
        expandBtn3.tintColor = .systemGray2
        expandBtn3.setImage(UIImage(systemName: "arrow.up.left.and.arrow.down.right.circle.fill"), for: .normal)
        self.privacyView.addSubview(self.expandBtn3)
        
        self.expandGesture3 = UIPanGestureRecognizer(target: self, action: #selector(expandView3(_:)))
        self.expandBtn3.addGestureRecognizer(expandGesture3)
    }
    
    func setBtnUI4(){
        deleteBtn4.frame = CGRect(x: self.maskingZone4.frame.origin.x - 25, y: self.maskingZone4.frame.origin.y - 25, width: 50, height: 50)
        deleteBtn4.tintColor = .systemGray2
        deleteBtn4.setImage(UIImage(systemName: "multiply.circle.fill"), for: .normal)
        deleteBtn4.addTarget(self, action: #selector(deleteView4(_:)), for: .touchUpInside)
        self.privacyView.addSubview(self.deleteBtn4)
        
        expandBtn4.frame = CGRect(x: self.maskingZone4.frame.origin.x + self.maskingZone4.frame.width - 25, y: self.maskingZone4.frame.origin.y + self.maskingZone4.frame.height - 25, width: 50, height: 50)
        expandBtn4.tintColor = .systemGray2
        expandBtn4.setImage(UIImage(systemName: "arrow.up.left.and.arrow.down.right.circle.fill"), for: .normal)
        self.privacyView.addSubview(self.expandBtn4)
        
        self.expandGesture4 = UIPanGestureRecognizer(target: self, action: #selector(expandView4(_:)))
        self.expandBtn4.addGestureRecognizer(expandGesture4)
    }
    
    func focusView1() {
        self.privacyView.addSubview(self.deleteBtn1)
        self.privacyView.addSubview(self.expandBtn1)
        
        self.setBtnUI1()
        
        self.privacyView.bringSubviewToFront(self.maskingZone1)
        self.privacyView.bringSubviewToFront(self.deleteBtn1)
        self.privacyView.bringSubviewToFront(self.expandBtn1)
        
        self.setBorderLayer(zone: self.maskingZone1)
        
        self.maskingZone1.addGestureRecognizer(gesture1)
        self.maskingZone2.removeGestureRecognizer(gesture2)
        self.maskingZone3.removeGestureRecognizer(gesture3)
        self.maskingZone4.removeGestureRecognizer(gesture4)
        
        self.deleteBtn2.removeFromSuperview()
        self.expandBtn2.removeFromSuperview()
        self.deleteBtn3.removeFromSuperview()
        self.expandBtn3.removeFromSuperview()
        self.deleteBtn4.removeFromSuperview()
        self.expandBtn4.removeFromSuperview()
    }
    
    func focusView2() {
        self.privacyView.addSubview(self.deleteBtn2)
        self.privacyView.addSubview(self.expandBtn2)
        
        self.setBtnUI2()
        
        self.privacyView.bringSubviewToFront(self.maskingZone2)
        self.privacyView.bringSubviewToFront(self.deleteBtn2)
        self.privacyView.bringSubviewToFront(self.expandBtn2)
        
        self.setBorderLayer(zone: self.maskingZone2)
        
        self.maskingZone2.addGestureRecognizer(gesture2)
        self.maskingZone1.removeGestureRecognizer(gesture1)
        self.maskingZone3.removeGestureRecognizer(gesture3)
        self.maskingZone4.removeGestureRecognizer(gesture4)
        
        self.deleteBtn1.removeFromSuperview()
        self.expandBtn1.removeFromSuperview()
        self.deleteBtn3.removeFromSuperview()
        self.expandBtn3.removeFromSuperview()
        self.deleteBtn4.removeFromSuperview()
        self.expandBtn4.removeFromSuperview()
    }
    
    func focusView3() {
        self.privacyView.addSubview(self.deleteBtn3)
        self.privacyView.addSubview(self.expandBtn3)
        
        self.setBtnUI3()
        
        self.privacyView.bringSubviewToFront(self.maskingZone3)
        self.privacyView.bringSubviewToFront(self.deleteBtn3)
        self.privacyView.bringSubviewToFront(self.expandBtn3)
        
        self.setBorderLayer(zone: self.maskingZone3)
        
        self.maskingZone3.addGestureRecognizer(gesture3)
        self.maskingZone2.removeGestureRecognizer(gesture2)
        self.maskingZone1.removeGestureRecognizer(gesture1)
        self.maskingZone4.removeGestureRecognizer(gesture4)
        
        self.deleteBtn2.removeFromSuperview()
        self.expandBtn2.removeFromSuperview()
        self.deleteBtn1.removeFromSuperview()
        self.expandBtn1.removeFromSuperview()
        self.deleteBtn4.removeFromSuperview()
        self.expandBtn4.removeFromSuperview()
    }
    
    func focusView4() {
        self.privacyView.addSubview(self.deleteBtn4)
        self.privacyView.addSubview(self.expandBtn4)
        
        self.setBtnUI4()
        
        self.privacyView.bringSubviewToFront(self.maskingZone4)
        self.privacyView.bringSubviewToFront(self.deleteBtn4)
        self.privacyView.bringSubviewToFront(self.expandBtn4)
        
        self.setBorderLayer(zone: self.maskingZone4)
        
        self.maskingZone4.addGestureRecognizer(gesture4)
        self.maskingZone2.removeGestureRecognizer(gesture2)
        self.maskingZone3.removeGestureRecognizer(gesture3)
        self.maskingZone1.removeGestureRecognizer(gesture1)
        
        self.deleteBtn2.removeFromSuperview()
        self.expandBtn2.removeFromSuperview()
        self.deleteBtn3.removeFromSuperview()
        self.expandBtn3.removeFromSuperview()
        self.deleteBtn1.removeFromSuperview()
        self.expandBtn1.removeFromSuperview()
    }
    
    func setMaskingView(index: Int) {
        switch index {
        case 0:
            self.maskingZone1 = MaskingZone1(frame: self.privacyView.frame)
            self.maskingZone1.frame = CGRect(x: self.privacyView.bounds.midX - 50, y: self.privacyView.bounds.midY - 50, width: 100, height: 100)
            self.maskingZone1.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.3)
            
            self.privacyView.addSubview(self.maskingZone1)
            
            self.tap1 = UITapGestureRecognizer(target: self, action: #selector(self.tapMaskingView1(_:)))
            self.gesture1 = UIPanGestureRecognizer(target: self, action: #selector(self.panMaskingView1(_:)))
            
            self.focusView1()
            
            self.maskingZone1.addGestureRecognizer(self.tap1)
            self.maskingZone1.addGestureRecognizer(self.gesture1)
            
        case 1:
            self.maskingZone2 = MaskingZone2(frame: self.privacyView.frame)
            self.maskingZone2.frame = CGRect(x: self.privacyView.bounds.midX - 50, y: self.privacyView.bounds.midY - 50, width: 100, height: 100)
            self.maskingZone2.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.3)
            
            self.privacyView.addSubview(self.maskingZone2)
            
            self.tap2 = UITapGestureRecognizer(target: self, action: #selector(self.tapMaskingView2(_:)))
            self.gesture2 = UIPanGestureRecognizer(target: self, action: #selector(self.panMaskingView2(_:)))
            
            self.focusView2()
            
            self.maskingZone2.addGestureRecognizer(self.tap2)
            self.maskingZone2.addGestureRecognizer(self.gesture2)
            
        case 2:
            self.maskingZone3 = MaskingZone1(frame: self.privacyView.frame)
            self.maskingZone3.frame = CGRect(x: self.privacyView.bounds.midX - 50, y: self.privacyView.bounds.midY - 50, width: 100, height: 100)
            self.maskingZone3.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.3)
            
            self.privacyView.addSubview(self.maskingZone3)
            
            self.tap3 = UITapGestureRecognizer(target: self, action: #selector(self.tapMaskingView3(_:)))
            self.gesture3 = UIPanGestureRecognizer(target: self, action: #selector(self.panMaskingView3(_:)))
            
            self.focusView3()
            
            self.maskingZone3.addGestureRecognizer(self.tap3)
            self.maskingZone3.addGestureRecognizer(self.gesture3)
            
        case 3:
            self.maskingZone4 = MaskingZone4(frame: self.privacyView.frame)
            self.maskingZone4.frame = CGRect(x: self.privacyView.bounds.midX - 50, y: self.privacyView.bounds.midY - 50, width: 100, height: 100)
            self.maskingZone4.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 0.3)
            
            self.privacyView.addSubview(self.maskingZone4)
            
            self.tap4 = UITapGestureRecognizer(target: self, action: #selector(self.tapMaskingView4(_:)))
            self.gesture4 = UIPanGestureRecognizer(target: self, action: #selector(self.panMaskingView4(_:)))
            
            self.focusView4()
            
            self.maskingZone4.addGestureRecognizer(self.tap4)
            self.maskingZone4.addGestureRecognizer(self.gesture4)
        default:
            print("default")
        }
    }
}

class DeleteBtnView1: UIView {
    override func draw(_ rect: CGRect) {
    }
}

class DeleteBtnView2: UIView {
    override func draw(_ rect: CGRect) {
    }
}

class DeleteBtnView3: UIView {
    override func draw(_ rect: CGRect) {
    }
}

class DeleteBtnView4: UIView {
    override func draw(_ rect: CGRect) {
    }
}

class ExpandBtnView1: UIView {
    override func draw(_ rect: CGRect) {
    }
}

class ExpandBtnView2: UIView {
    override func draw(_ rect: CGRect) {
    }
}

class ExpandBtnView3: UIView {
    override func draw(_ rect: CGRect) {
    }
}

class ExpandBtnView4: UIView {
    override func draw(_ rect: CGRect) {
    }
}

class MaskingZone1: UIView {
    override func draw(_ rect: CGRect) {
    }
}

class MaskingZone2: UIView {
    override func draw(_ rect: CGRect) {
    }
}

class MaskingZone3: UIView {
    override func draw(_ rect: CGRect) {
    }
}

class MaskingZone4: UIView {
    override func draw(_ rect: CGRect) {
    }
}
