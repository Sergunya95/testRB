//
//  SKBestOddsTableViewCell.swift
//  testRB
//
//  Created by apple on 31.05.2022.
//

import UIKit
import SnapKit

class SKBestOddsTableViewCell: UITableViewCell {

    // MARK: - Properties
    static let winOdd = 2.14
    static let lossOdd = 1.92
    static let returnOdd = 0.55
    static let allBets = 1.26
    
    static let identifier = "SKBestOddsTableViewCell"
    
    //MARK: - Elements
    private let view: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let bestOddToWinLabel: UILabel = {
        let bestOddToWinLabel = UILabel()
        bestOddToWinLabel.text = "Лучший коэффициент выигрыша"
        bestOddToWinLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        return bestOddToWinLabel
    }()
    
    private let greenButton: UIButton = {
        let greenButton = UIButton()
        greenButton.backgroundColor = UIColor(red: 0.329, green: 0.686, blue: 0.478, alpha: 1)
        greenButton.layer.cornerRadius = 15
        greenButton.setTitle("к: 4,19", for: .normal)
        greenButton.tintColor = .white
        greenButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        return greenButton
    }()
    
    private let line: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray5
        return line
    }()
    
    private let averageOddsLabel: UILabel = {
        let averageOdds = UILabel()
        averageOdds.text = "Средние коэффициенты"
        averageOdds.font = .systemFont(ofSize: 15, weight: .semibold)
        return averageOdds
    }()
    
    private let winOddProgressView: UIProgressView = {
        let winOddProgressView = UIProgressView()
        winOddProgressView.progressTintColor = UIColor(red: 0.329, green: 0.686, blue: 0.478, alpha: 1)
        winOddProgressView.progress = Float(winOdd / 3)
        return winOddProgressView
    }()
    
    private let winOddLabel: UILabel = {
        let winOddLabel = UILabel()
        winOddLabel.text = "\(winOdd)"
        winOddLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        winOddLabel.textAlignment = .right
        return winOddLabel
    }()
    
    private let winLabel: UILabel = {
        let winLabel = UILabel()
        winLabel.text = "Выигрыш"
        winLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        winLabel.textColor = .lightGray
        return winLabel
    }()
    
    private let lossOddProgressView: UIProgressView = {
        let lossOddProgressView = UIProgressView()
        lossOddProgressView.progressTintColor = UIColor(red: 0.714, green: 0.224, blue: 0.212, alpha: 1)
        lossOddProgressView.progress = Float(lossOdd / 3)
        return lossOddProgressView
    }()
    
    private let lossOddLabel: UILabel = {
        let lossOddLabel = UILabel()
        lossOddLabel.text = "\(lossOdd)"
        lossOddLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        lossOddLabel.textAlignment = .right
        return lossOddLabel
    }()
    
    private let lossLabel: UILabel = {
        let lossLabel = UILabel()
        lossLabel.text = "Проигрыш"
        lossLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        lossLabel.textColor = .lightGray
        return lossLabel
    }()
    
    private let returnOddProgressView: UIProgressView = {
        let returnOddProgressView = UIProgressView()
        returnOddProgressView.progressTintColor = .lightGray
        returnOddProgressView.progress = Float(returnOdd / 3)
        return returnOddProgressView
    }()
    
    private let returnOddLabel: UILabel = {
        let returnOddLabel = UILabel()
        returnOddLabel.text = "\(returnOdd)"
        returnOddLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        returnOddLabel.textAlignment = .right
        return returnOddLabel
    }()
    
    private let returnLabel: UILabel = {
        let returnLabel = UILabel()
        returnLabel.text = "Возврат"
        returnLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        returnLabel.textColor = .lightGray
        return returnLabel
    }()
    
    private let allBetsOddProgressView: UIProgressView = {
        let allBetsOddProgressView = UIProgressView()
        allBetsOddProgressView.progressTintColor = .systemCyan
        allBetsOddProgressView.progress = Float(allBets / 3)
        return allBetsOddProgressView
    }()
    
    private let allBetsOddLabel: UILabel = {
        let allBetsOddLabel = UILabel()
        allBetsOddLabel.text = "\(allBets)"
        allBetsOddLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        allBetsOddLabel.textAlignment = .right
        return allBetsOddLabel
    }()
    
    private let allBetsLabel: UILabel = {
        let allBetsLabel = UILabel()
        allBetsLabel.text = "Все ставки"
        allBetsLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        allBetsLabel.textColor = .lightGray
        return allBetsLabel
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray6
        contentView.addSubview(view)
        view.addSubview(bestOddToWinLabel)
        view.addSubview(greenButton)
        view.addSubview(line)
        view.addSubview(averageOddsLabel)
        view.addSubview(winOddProgressView)
        view.addSubview(winOddLabel)
        view.addSubview(winLabel)
        view.addSubview(lossOddProgressView)
        view.addSubview(lossOddLabel)
        view.addSubview(lossLabel)
        view.addSubview(returnOddProgressView)
        view.addSubview(returnOddLabel)
        view.addSubview(returnLabel)
        view.addSubview(allBetsOddProgressView)
        view.addSubview(allBetsOddLabel)
        view.addSubview(allBetsLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LayoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        
        view.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(8)
        }
        
        bestOddToWinLabel.snp.makeConstraints { make in
            make.left.equalTo(view).inset(16)
            make.top.equalTo(view).inset(20)
        }
        
        greenButton.snp.makeConstraints { make in
            make.right.equalTo(view).inset(16)
            make.top.equalTo(view).inset(16)
            make.left.equalTo(bestOddToWinLabel.snp.right).offset(16)
            make.height.equalTo(31)
            make.width.equalTo(70)
        }
        
        line.snp.makeConstraints { make in
            make.left.right.equalTo(view)
            make.top.equalTo(greenButton.snp.bottom).offset(16)
            make.height.equalTo(1)
        }
        
        averageOddsLabel.snp.makeConstraints { make in
            make.right.left.equalTo(view).inset(16)
            make.top.equalTo(line).offset(16)
        }
        
        winOddProgressView.snp.makeConstraints { make in
            make.left.equalTo(view).inset(16)
            make.top.equalTo(averageOddsLabel.snp.bottom).offset(16)
            make.height.equalTo(8)
        }
        
        winOddLabel.snp.makeConstraints { make in
            make.right.equalTo(view).inset(16)
            make.left.equalTo(winLabel.snp.right).offset(16)
            make.top.equalTo(averageOddsLabel.snp.bottom).offset(11)
            make.width.equalTo(40)
        }
        
        winLabel.snp.makeConstraints { make in
            make.right.equalTo(winOddLabel.snp.left).offset(16)
            make.left.equalTo(winOddProgressView.snp.right).offset(16)
            make.top.equalTo(averageOddsLabel.snp.bottom).offset(11)
            make.width.equalTo(90)
        }
        
        lossOddProgressView.snp.makeConstraints { make in
            make.left.equalTo(view).inset(16)
            make.top.equalTo(winOddProgressView.snp.bottom).offset(20)
            make.height.equalTo(8)
        }
        
        lossOddLabel.snp.makeConstraints { make in
            make.right.equalTo(view).inset(16)
            make.left.equalTo(lossLabel.snp.right).offset(16)
            make.top.equalTo(winOddLabel.snp.bottom).offset(11)
            make.width.equalTo(40)
        }
        
        lossLabel.snp.makeConstraints { make in
            make.right.equalTo(lossOddLabel.snp.left).offset(16)
            make.left.equalTo(lossOddProgressView.snp.right).offset(16)
            make.top.equalTo(winLabel.snp.bottom).offset(11)
            make.width.equalTo(90)
        }
        
        returnOddProgressView.snp.makeConstraints { make in
            make.left.equalTo(view).inset(16)
            make.top.equalTo(lossOddProgressView.snp.bottom).offset(20)
            make.height.equalTo(8)
        }
        
        returnOddLabel.snp.makeConstraints { make in
            make.right.equalTo(view).inset(16)
            make.left.equalTo(returnLabel.snp.right).offset(16)
            make.top.equalTo(lossOddLabel.snp.bottom).offset(11)
            make.width.equalTo(40)
        }
        
        returnLabel.snp.makeConstraints { make in
            make.right.equalTo(returnOddLabel.snp.left).offset(16)
            make.left.equalTo(returnOddProgressView.snp.right).offset(16)
            make.top.equalTo(lossLabel.snp.bottom).offset(11)
            make.width.equalTo(90)
        }
        
        allBetsOddProgressView.snp.makeConstraints { make in
            make.left.equalTo(view).inset(16)
            make.top.equalTo(returnOddProgressView.snp.bottom).offset(20)
            make.height.equalTo(8)
        }
        
        allBetsOddLabel.snp.makeConstraints { make in
            make.right.equalTo(view).inset(16)
            make.left.equalTo(allBetsLabel.snp.right).offset(16)
            make.top.equalTo(returnOddLabel.snp.bottom).offset(11)
            make.width.equalTo(40)
        }
        
        allBetsLabel.snp.makeConstraints { make in
            make.right.equalTo(allBetsOddLabel.snp.left).offset(16)
            make.left.equalTo(allBetsOddProgressView.snp.right).offset(16)
            make.top.equalTo(returnLabel.snp.bottom).offset(11)
            make.width.equalTo(90)
            make.bottom.equalTo(view.snp.bottom).inset(16)
        }
    }
}
