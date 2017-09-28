//
//  ARBasicObjectViewController.swift
//  SwiftyFont
//
//  Created by Ryan Hatter on 8/30/17.
//  Copyright © 2017 Wift, LLC. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ARBasicObjectViewController: UIViewController, ARSCNViewDelegate {
    
    var sceneView: ARSCNView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.sceneView = ARSCNView(frame: self.view.frame)
        self.view.addSubview(self.sceneView)
        
        sceneView.delegate = self
        
        sceneView.showsStatistics = true
        
        let scene = SCNScene()
        let box = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0.01)
        
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.green
        
        let node = SCNNode()
        node.geometry = box
        node.geometry?.materials = [material]
        node.position = SCNVector3(x: 0, y: 0.1, z: -0.5)
        
        scene.rootNode.addChildNode(node)
        
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


