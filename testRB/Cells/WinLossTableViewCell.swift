//
//  WinLossTableViewCell.swift
//  testRB
//
//  Created by apple on 26.05.2022.
//

import UIKit

class WinLossTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    let modelBookmaker = ModelBookmakers()
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lifecicle
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.text = "Выигрыши/проигрыши по букмекерам"
        self.tableView.register(UINib(nibName: "SecondTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.isScrollEnabled = false
    }
}

// MARK: - Extensions
extension WinLossTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelBookmaker.bookmakers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SecondTableViewCell {
            let bookmaker = modelBookmaker.bookmakers[indexPath.row]
            cell.configure(with: bookmaker)
            return cell
        }
        return UITableViewCell()
    }
}
