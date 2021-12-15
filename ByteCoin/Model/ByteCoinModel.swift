//
//  File.swift
//  ByteCoin
//
//  Created by fernando babonoyaba on 12/14/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation


struct ByteCoinModel {
    let rate: Double
    
    func getRateString() -> String{
        return String(format: "%.02f", rate)
    }
}
