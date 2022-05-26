//
//  BestOddsTableViewCell.swift
//  testRB
//
//  Created by apple on 26.05.2022.
//

import UIKit

class BestOddsTableViewCell: UITableViewCell {

    // MARK: - Properties
    let winOdd = 2.14
    let lossOdd = 1.92
    let returnOdd = 0.55
    let allBets = 1.26
    
    // MARK: - Outlets
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var winOddLabel: UILabel!
    @IBOutlet weak var lossOddLabel: UILabel!
    @IBOutlet weak var returnOddLabel: UILabel!
    @IBOutlet weak var allBetsLabel: UILabel!
    @IBOutlet weak var winOddProgressView: UIProgressView!
    @IBOutlet weak var lossOddProgressView: UIProgressView!
    @IBOutlet weak var returnOddProgressView: UIProgressView!
    @IBOutlet weak var allBetsProgressView: UIProgressView!
    
    // MARK: - Lifecicle
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    // MARK: - Methods
    func configure() {
        greenButton.layer.cornerRadius = 15
        winOddLabel.text = "\(winOdd)"
        lossOddLabel.text = "\(lossOdd)"
        returnOddLabel.text = "\(returnOdd)"
        allBetsLabel.text = "\(allBets)"
        winOddProgressView.progress = Float(winOdd / 3)
        lossOddProgressView.progress = Float(lossOdd / 3)
        returnOddProgressView.progress = Float(returnOdd / 3)
        allBetsProgressView.progress = Float(allBets / 3)
    }
    
}
