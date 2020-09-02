//
//  ItemDataForTable.swift
//  ARaddin_challenge
//
//  Created by Julieth Angel on 9/1/20.
//  Copyright © 2020 ARaddin. All rights reserved.
//

import UIKit

class ItemDataForTable: UIView, UITableViewDelegate, UITableViewDataSource {
    var arItems = [ARItem]()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "arItems", for: indexPath) as! ItemTableViewCell
        cell.nameLabel.text = arItems[indexPath.row].name
        return cell
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
