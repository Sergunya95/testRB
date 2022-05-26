//
//  ViewController.swift
//  testRB
//
//  Created by apple on 26.05.2022.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    let modelBookmaker = ModelBookmakers()
    
    // MARK: - Outlelets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lifecicle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "WinLossTableViewCell", bundle: nil), forCellReuseIdentifier: "WinLossTableViewCell")
        self.tableView.register(UINib(nibName: "BestOddsTableViewCell", bundle: nil), forCellReuseIdentifier: "BestOddsTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

// MARK: - Extensions
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item % 2 == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "BestOddsTableViewCell", for: indexPath) as? BestOddsTableViewCell {
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "WinLossTableViewCell", for: indexPath) as? WinLossTableViewCell {
                return cell
            }
        }
        return UITableViewCell()
    }
}
