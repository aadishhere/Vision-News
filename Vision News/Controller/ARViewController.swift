//
//  ViewController.swift
//  Vision News
//
//  Created by Aadish Jain on 06/11/24.
//

import UIKit
import SceneKit
import ARKit

class ARViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    var movieName = String()
    var trackedImageName = String()
    
    @IBOutlet weak var menu: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menu.image = UIImage(systemName: "list.bullet")
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
            
        if let trackedImages = ARReferenceImage.referenceImages(inGroupNamed: "NewsImages", bundle: Bundle.main) {
            
            configuration.trackingImages = trackedImages
            
            configuration.maximumNumberOfTrackedImages = 1
            
        }

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
    func renderer(_ renderer: any SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        
        let node = SCNNode()
        
        if let imageAnchor = anchor as? ARImageAnchor {
            
            trackedImageName = imageAnchor.referenceImage.name!
            
            if imageAnchor.referenceImage.name == trackedImageName {
                movieName = "\(trackedImageName).mp4"
            }
            
            let videoNode = SKVideoNode(fileNamed: movieName)
            
            videoNode.play()
            
            let videoScene = SKScene(size: CGSize(width: 1920, height: 1080))
            
            videoNode.position = CGPoint(x: videoScene.size.width / 2, y: videoScene.size.height / 2)
            
            videoNode.yScale = -1
            
            videoScene.addChild(videoNode)
            
            let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
            
            plane.firstMaterial?.diffuse.contents = videoScene
            
            let planeNode = SCNNode(geometry: plane)
            
            planeNode.eulerAngles.x = -.pi / 2
            
            node.addChildNode(planeNode)
            
        }
        return node
    }
    
    @IBAction func menuButtonPressed(_ sender: UIBarButtonItem) {
        
    }
}
