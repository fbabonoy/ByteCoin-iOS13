//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bitCoinSelector.delegate = self
        coinManager.byteCoinDelegate = self
    }
    var coinManager = CoinManager()

    @IBOutlet weak var displayedValue: UILabel!
    @IBOutlet weak var bitCoinSelector: UIPickerView!
    
}

extension ViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.capacity
    }
    
}

extension ViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coinManager.fetchdata(currencyType: coinManager.currencyArray[row])
        
    }
}

extension ViewController: ByteCoinProtocal{
    
    func updateValue(_ rate: ByteCoinModel) {
        DispatchQueue.main.async {
            self.displayedValue.text = rate.getRateString()
        }
    }
    
    
}
