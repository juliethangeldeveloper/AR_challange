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
    var constrain = NSLayoutConstraint()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arItems.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "arItems", for: indexPath) as! ItemTableViewCell
        cell.nameLabel.text = arItems[indexPath.row].name
        cell.layer.backgroundColor = UIColor.clear.cgColor

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          constrain.constant = 500
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
