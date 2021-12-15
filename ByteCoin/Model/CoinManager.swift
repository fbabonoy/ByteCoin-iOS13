//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol ByteCoinProtocal{
    func updateValue(_ rate: ByteCoinModel)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "71E14D3E-1DB5-421D-989E-4D3755C35C5C"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    var byteCoinDelegate: ByteCoinProtocal?
    
    func fetchdata(currencyType: String){
        let urlString = "\(baseURL)/\(currencyType)?apikey=\(apiKey)"
        performRequest(with: urlString)
        
    }
    
    
    func performRequest(with urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, respose, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let currentData = data {
                    if let passValue = parseJSON(currentValue: currentData){
                        print(passValue)
                        byteCoinDelegate?.updateValue(passValue)
                    }


                }
            }
            task.resume()
        }
    }
    
    func parseJSON(currentValue: Data) -> ByteCoinModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(ByteCoinData.self, from: currentValue)
            let rate = decodedData.rate
            let byteValue = ByteCoinModel(rate: rate)
            return byteValue
        } catch {
            print(error)
            return nil
        }
        
    }
    
   
    
}
