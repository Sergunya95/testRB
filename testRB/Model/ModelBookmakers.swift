//
//  ModelBookmakers.swift
//  testRB
//
//  Created by apple on 26.05.2022.
//

import Foundation

import UIKit

class ModelBookmakers {
    
    // MARK: - Properties
    var bookmakers = [Bookmaker]()
    
    // MARK: - Initialization
    init() {
        setup()
    }
    
    // MARK: - Methods
    func setup() {
        let firstBookmaker = Bookmaker(image: UIImage(named: "logo1")!, wins: 5, loss: 6, returns: 7)
        let secondBookmaker = Bookmaker(image: UIImage(named: "logo2")!, wins: 10, loss: 7, returns: 4)
        bookmakers.append(firstBookmaker)
        bookmakers.append(secondBookmaker)
    }
}
