//
//  ViewController.swift
//  DianaAppStore_Demo
//
//  Created by Yejin Hong on 6/30/24.
//

import UIKit

class TodayViewController: UIViewController {
    var sections: [Section] = []
    
    let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private let collectionViewLayout: UICollectionViewLayout = {
        
    }()
}

