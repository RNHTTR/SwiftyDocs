//
//  BasicARObjectViewController.swift
//  SwiftyFont
//
//  Created by Ryan Hatter on 8/30/17.
//  Copyright © 2017 Wift, LLC. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ARMultipleObjectsViewController: UIViewController, ARSCNViewDelegate {
    
    var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sceneView = ARSCNView(frame: self.view.frame)
        self.view.addSubview(self.sceneView)
        
        sceneView.delegate = self
        
        sceneView.showsStatistics = true
        
        let scene = SCNScene()
        let box = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0.01)
        
        let boxMaterial = SCNMaterial()
        boxMaterial.diffuse.contents = UIImage(named: "marioSide")
        
        let boxNode = SCNNode()
        boxNode.geometry = box
        boxNode.geometry?.materials = [boxMaterial]
        boxNode.position = SCNVector3(x: 0.2, y: 0.1, z: -0.5)
        
        let sphere = SCNSphere(radius: 0.2)
        let sphereMaterial = SCNMaterial()
        sphereMaterial.diffuse.contents = UIImage(named: "bobOmb")
        
        let sphereNode = SCNNode()
        sphereNode.geometry = sphere
        sphereNode.geometry?.materials = [sphereMaterial]
        
        sphereNode.position = SCNVector3(x: -0.2, y: -0.2, z: -1.0)
        
        scene.rootNode.addChildNode(boxNode)
        scene.rootNode.addChildNode(sphereNode)
        
        sceneView.scene = scene
        
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
    
}

