//
//  ViewController.swift
//  ARaddin_challenge
//
//  Created by Julieth Angel on 8/31/20.
//  Copyright © 2020 ARaddin. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var constrainSlideTable: NSLayoutConstraint!
    var dataArItems = ItemDataForTable()
    var arItems = [ARItem]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJSON(atURL: "https://api.sketchfab.com/v2/models?token=7f9e2e823a074646bec2e89b96e9b7fe")

        // Set the view's delegate
        sceneView.delegate = self
        
       
        // Show statistics such as fps and timing information
         tableView.delegate = dataArItems
        tableView.dataSource = dataArItems
        
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
