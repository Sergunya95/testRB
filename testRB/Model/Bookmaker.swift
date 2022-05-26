//
//  Bookmaker.swift
//  testRB
//
//  Created by apple on 26.05.2022.
//

import Foundation
import UIKit

class Bookmaker: NSObject {
    
    // MARK: - Properties
    var image: UIImage
    var wins: Double
    var loss: Double
    var returns: Double
    
    // MARK: - Initialization
    init(image: UIImage, wins: Double, loss: Double, returns: Double) {
        self.image = image
        self.wins = wins
        self.loss = loss
        self.returns = returns
    }
}
