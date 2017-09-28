//
//  ARTextViewController.swift
//  SwiftyFont
//
//  Created by Ryan Hatter on 8/31/17.
//  Copyright © 2017 Wift, LLC. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ARTextViewController: UIViewController, ARSCNViewDelegate {

    var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.sceneView = ARSCNView(frame: self.view.frame)
        self.view.addSubview(self.sceneView)
        
        sceneView.delegate = self
        
        sceneView.showsStatistics = true
        
        let scene = SCNScene()
        
        let textGeometry = SCNText(string: "Hello World!", extrusionDepth: 1.0)
        textGeometry.firstMaterial?.diffuse.contents = UIColor.blue
        
        let textNode = SCNNode(geometry: textGeometry)
        textNode.position = SCNVector3(x: -1, y: -0.2, z: -1)
        textNode.scale = SCNVector3(x: 0.02, y: 0.02, z: 0.02)
        
        scene.rootNode.addChildNode(textNode)
        
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
