//
//  ViewController.swift
//  DianaCoreData_Demo
//
//  Created by Yejin Hong on 8/1/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var touchedNumber: UILabel!
    @IBOutlet weak var touchButton: UIButton!
    @IBOutlet weak var savedTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    let viewModel = CoreDataViewModel()
    var number: Int16 = 0
    var text: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let data = viewModel.fetchData() {
            number = data.number
            text = data.text ?? ""
            
            touchedNumber.text = String(number)
            savedTextField.text = text
        }
    }

    @IBAction func touchNumberButton(_ sender: Any) {
        number += 1
        touchedNumber.text = String(number)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        number = Int16(touchedNumber.text ?? "0") ?? 0
        text = savedTextField.text ?? ""
        
        if let data = viewModel.fetchData() {
            viewModel.updateData(number: self.number, text: self.text)
        } else {
            viewModel.addData(number: self.number, text: self.text)
        }
    }
    
    @IBAction func resetButton(_ sender: Any) {
        touchedNumber.text = "0"
        savedTextField.text = ""
        
        viewModel.deleteData()
    }
}

