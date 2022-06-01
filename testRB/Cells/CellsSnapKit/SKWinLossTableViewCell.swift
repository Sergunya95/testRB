//
//  SKWinLossTableViewCell.swift
//  testRB
//
//  Created by apple on 01.06.2022.
//

import UIKit
import SnapKit

class SKWinLossTableViewCell: UITableViewCell {

    // MARK: - Properties
    let modelBookmaker = ModelBookmakers()
    static let identifier = "SKWinLossTableViewCell"
    
    //MARK: - Elements
    private let view: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let winLossLabel: UILabel = {
        let winLossLabel = UILabel()
        winLossLabel.text = "Выигрыши/проигрыши по букмекерам"
        winLossLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        return winLossLabel
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SKSecondTableViewCell.self, forCellReuseIdentifier: SKSecondTableViewCell.identifier)
        return tableView
    }()
    
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray6
        contentView.addSubview(view)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .singleLine
        self.tableView.isScrollEnabled = false
        view.addSubview(winLossLabel)
        view.addSubview(tableView)
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

        winLossLabel.snp.makeConstraints { make in
            make.left.equalTo(view).inset(16)
            make.top.equalTo(view).inset(20)
        }

        tableView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(view)
            make.top.equalTo(winLossLabel.snp.bottom).offset(8)
        }
    }
}


// MARK: - Extensions
extension SKWinLossTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelBookmaker.bookmakers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: SKSecondTableViewCell.identifier, for: indexPath) as? SKSecondTableViewCell {
            let bookmaker = modelBookmaker.bookmakers[indexPath.row]
            cell.configure(with: bookmaker)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 104
        }
}
