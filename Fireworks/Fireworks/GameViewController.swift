//
//  GameViewController.swift
//  Fireworks
//
//  Created by Arsh on 11/19/22.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .landscape
        } else {
            return .all
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard let skView = view as? SKView else { return }
        guard let gameScene = skView.scene as? GameScene else { return }
        gameScene.explodeFireworks()
        scoreLabel.text = "Score: \(gameScene.score)"
    }
    
    @IBAction func explodeDidTouchUpInside(_ sender: Any) {
        guard let skView = view as? SKView else { return }
        guard let gameScene = skView.scene as? GameScene else { return }
        gameScene.explodeFireworks()
        scoreLabel.text = "Score: \(gameScene.score)"
    }
}
