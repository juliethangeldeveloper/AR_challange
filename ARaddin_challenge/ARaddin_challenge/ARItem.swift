//
//  ARItem.swift
//  ARaddin_challenge
//
//  Created by Julieth Angel on 9/1/20.
//  Copyright © 2020 ARaddin. All rights reserved.
//

import Foundation
import UIKit

class ARItem{
   
    
    let name: String
    let url: String
    let embeded: String
    let id: String
    let urlid: String

   init(name: String, url: String, embeded: String, id: String, urlid: String) {
         self.name = name
         self.url = url
         self.embeded = embeded
         self.id = id
         self.urlid = urlid
     }
}
