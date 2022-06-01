//
//  SKSecondTableViewCell.swift
//  testRB
//
//  Created by apple on 01.06.2022.
//

import UIKit
import SnapKit

class SKSecondTableViewCell: UITableViewCell {

    //MARK: - Properties
    var betsCount = Int()
    var greenLineWidth = Double()
    var redLineWidth = Double()
    var grayLineWidth = Double()
    
    static var bookmaker: Bookmaker?
    static let identifier = "SKSecondTableViewCell"
    
    //MARK: - Elements
    private let image: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let betsCountLabel: UILabel = {
        let betsCountLabel = UILabel()
        betsCountLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        return betsCountLabel
    }()
    
    private let greenLine: UIView = {
        let greenLine = UIView()
        greenLine.backgroundColor = UIColor(red: 0.329, green: 0.686, blue: 0.478, alpha: 1)
        return greenLine
    }()
    
    private let redLine: UIView = {
        let redLine = UIView()
        redLine.backgroundColor = UIColor(red: 0.714, green: 0.224, blue: 0.212, alpha: 1)
        return redLine
    }()
    
    private let grayLine: UIView = {
        let grayLine = UIView()
        grayLine.backgroundColor = .lightGray
        return grayLine
    }()
    
    private let winBetsCount: UILabel = {
        let winBetsCount = UILabel()
        winBetsCount.font = .systemFont(ofSize: 14, weight: .semibold)
        return winBetsCount
    }()
    
    private let lossBetsCount: UILabel = {
        let lossBetsCount = UILabel()
        lossBetsCount.font = .systemFont(ofSize: 14, weight: .semibold)
        return lossBetsCount
    }()
    
    private let returnBetsCount: UILabel = {
        let returnBetsCount = UILabel()
        returnBetsCount.font = .systemFont(ofSize: 14, weight: .semibold)
        returnBetsCount.textAlignment = .right
        return returnBetsCount
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(image)
        contentView.addSubview(betsCountLabel)
        contentView.addSubview(greenLine)
        contentView.addSubview(redLine)
        contentView.addSubview(grayLine)
        contentView.addSubview(winBetsCount)
        contentView.addSubview(lossBetsCount)
        contentView.addSubview(returnBetsCount)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func configure(with bookmaker: Bookmaker) {
        image.image = bookmaker.image
        image.contentMode = .scaleToFill
        betsCount = Int(bookmaker.wins + bookmaker.loss + bookmaker.returns)
        betsCountLabel.text = "\(betsCount.bets())"
        winBetsCount.text = "\(Int(bookmaker.wins))(\(Int((bookmaker.wins/Double(betsCount)) * 100))%)"
        lossBetsCount.text = "\(Int(bookmaker.loss))(\(Int((bookmaker.loss / Double(betsCount)) * 100))%)"
        returnBetsCount.text = "\(Int(bookmaker.returns))(\(Int((bookmaker.returns / Double(betsCount)) * 100))%)"
        greenLineWidth = (UIScreen.main.bounds.width - 40) * CGFloat((bookmaker.wins / Double(betsCount)))
        redLineWidth = (UIScreen.main.bounds.width - 40) * CGFloat((bookmaker.loss / Double(betsCount)))
        grayLineWidth = (UIScreen.main.bounds.width - 40) * CGFloat((bookmaker.returns / Double(betsCount)))
    }

    
    //MARK: - LayoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        
        image.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(8)
            make.height.equalTo(40)
            make.width.equalTo(100)
        }
        
        betsCountLabel.snp.makeConstraints { make in
            make.left.equalTo(image.snp.right).offset(8)
            make.top.equalToSuperview().inset(30)
        }
        
        greenLine.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(12)
            make.left.equalToSuperview().inset(16)
            make.height.equalTo(8)
            make.width.equalTo(greenLineWidth)
        }
        
        redLine.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(12)
            make.left.equalTo(greenLine.snp.right).offset(4)
            make.height.equalTo(8)
            make.width.equalTo(redLineWidth)
        }
        
        grayLine.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(12)
            make.left.equalTo(redLine.snp.right).offset(4)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(8)
            make.width.equalTo(greenLineWidth)
        }
        
        winBetsCount.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.top.equalTo(grayLine.snp.bottom).offset(8)
        }
        
        lossBetsCount.snp.makeConstraints { make in
            make.left.equalTo(greenLine.snp.right).offset(4)
            make.top.equalTo(redLine.snp.bottom).offset(8)
        }
        
        returnBetsCount.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(16)
            make.top.equalTo(redLine.snp.bottom).offset(8)
        }
    }
}
