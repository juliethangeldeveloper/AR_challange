//
//  VC_extension.swift
//  ARaddin_challenge
//
//  Created by Julieth Angel on 9/1/20.
//  Copyright © 2020 ARaddin. All rights reserved.
//

import Foundation
import UIKit
import ARKit

extension ViewController{
    
    
    func downloadJSON(atURL urlString: String) {
     
            let config = URLSessionConfiguration.default
    
            let session = URLSession(configuration: config)
        
            if let validURL = URL(string: urlString) {
                
                let task = session.dataTask(with: validURL, completionHandler: { (opt_data, opt_response, opt_error) in
                    
                    //Bail Out on error
                    if opt_error != nil { assertionFailure(); return }
                    
                    //Check the response, statusCode, and data
                    guard let response = opt_response as? HTTPURLResponse,
                        response.statusCode == 200,
                        let data = opt_data
                        else { assertionFailure(); return
                    }
                    do {
                        //De-Serialize data object
                        if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                            if let firstData = json["results"] as? [Any]{
                              
                                for eachData in firstData{
                                      guard let eachObj = eachData as? [String: Any],let uid = eachObj["uid"] as? String, let urlid = eachObj["urlid"] as? String, let name = eachObj["name"] as? String, let viewerUrl = eachObj["viewerUrl"] as? String, let embeded = eachObj["embedUrl"] as? String
                                            else {return}

                                    let itemAr = ARItem(name: name, url: viewerUrl, embeded: embeded, id: uid, urlid: urlid)
                                    self.arItems.append(itemAr)
                                }
                            }
                            
                        }
                        
                    }
                    catch {
                        print(error.localizedDescription)
                        assertionFailure();
                    }
                    //  Do UI display
                    DispatchQueue.main.async {
                      
                           // Create a new scene
                        print(self.arItems.count)
                        if let scene = SCNScene(named: self.arItems[0].urlid){
                                print("WORKSSS")
                            // Set the scene to the view
                            self.sceneView.scene = scene
                        }else{
                            let scene = SCNScene(named: "art.scnassets/ship.scn")!
                            print("BUILDIN")

                            self.sceneView.scene = scene

                        }
                           
                    }
                })
                
                task.resume()
                
                
            }
            
            
        }
}
