//
//  ARTouchGestureViewController.swift
//  SwiftyFont
//
//  Created by Ryan Hatter on 8/30/17.
//  Copyright © 2017 Wift, LLC. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ARTouchGestureViewController: UIViewController, ARSCNViewDelegate {
    
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
        material.diffuse.contents = UIImage(named: "marioSide")
        
        let node = SCNNode()
        node.geometry = box
        node.geometry?.materials = [material]
        node.position = SCNVector3(x: 0, y: 0.1, z: -0.7)
        
        scene.rootNode.addChildNode(node)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        self.sceneView.addGestureRecognizer(tapGestureRecognizer)
        
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
    
    @objc func tap(recognizer: UIGestureRecognizer) {
        let sceneView = recognizer.view as! SCNView
        let touchLocation = recognizer.location(in: sceneView)
        let hitResults = sceneView.hitTest(touchLocation, options: [:])
        
        if !hitResults.isEmpty {
            let node = hitResults[0].node
            
            SCNTransaction.animationDuration = 0.5
            node.position = SCNVector3(x: 0, y: 0.5, z: -0.7)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                node.position = SCNVector3(x: 0, y: 0.1, z: -0.7)
            }
        }
    }
    
}
