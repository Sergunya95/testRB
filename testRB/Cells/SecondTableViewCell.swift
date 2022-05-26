//
//  SecondTableViewCell.swift
//  testRB
//
//  Created by apple on 26.05.2022.
//

import UIKit

class SecondTableViewCell: UITableViewCell {

    //MARK: - Properties
    var betsCount = Int()
    var bookmaker: Bookmaker?
    
    // MARK: - Outlets
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var firstBookmakerImage: UIImageView!
    @IBOutlet weak var firstBookmakerBetsCount: UILabel!
    @IBOutlet weak var greenLine: UIView!
    @IBOutlet weak var redLine: UIView!
    @IBOutlet weak var grayLine: UIView!
    @IBOutlet weak var greenLineWidth: NSLayoutConstraint!
    @IBOutlet weak var redLineWidth: NSLayoutConstraint!
    @IBOutlet weak var grayLineWidth: NSLayoutConstraint!
    @IBOutlet weak var winBetsCount: UILabel!
    @IBOutlet weak var lossBetsCount: UILabel!
    @IBOutlet weak var returnBetsCount: UILabel!

    // MARK: - Methods
    func configure(with bookmaker: Bookmaker) {
        firstBookmakerImage.image = bookmaker.image
        betsCount = Int(bookmaker.wins + bookmaker.loss + bookmaker.returns)
        firstBookmakerBetsCount.text = "\(betsCount.bets())"
        winBetsCount.text = "\(Int(bookmaker.wins))(\(Int((bookmaker.wins/Double(betsCount)) * 100))%)"
        lossBetsCount.text = "\(Int(bookmaker.loss))(\(Int((bookmaker.loss / Double(betsCount)) * 100))%)"
        returnBetsCount.text = "\(Int(bookmaker.returns))(\(Int((bookmaker.returns / Double(betsCount)) * 100))%)"
        greenLineWidth.constant = (UIScreen.main.bounds.width - 40) * CGFloat((bookmaker.wins / Double(betsCount)))
        redLineWidth.constant = (UIScreen.main.bounds.width - 40) * CGFloat((bookmaker.loss / Double(betsCount)))
        grayLineWidth.constant = (UIScreen.main.bounds.width - 40) * CGFloat((bookmaker.returns / Double(betsCount)))
    }
}

// MARK: - Extensions
extension Int {
     func bets() -> String {
         var betString: String!
         if "1".contains("\(self % 10)")      {betString = "ставка"}
         if "234".contains("\(self % 10)")    {betString = "ставки" }
         if "567890".contains("\(self % 10)") {betString = "ставок"}
         if 11...14 ~= self % 100             {betString = "ставок"}
    return "\(self) " + betString
    }
}
