//
//  DBreathViewController.swift
//  DeepBreath
//
//  Created by iOS123 on 2020/12/16.
//


import SwiftUI

public struct DBreathViewControllerView: UIViewControllerRepresentable {

    public func makeUIViewController(context: Context) -> some UIViewController {
        return DBreathViewController(nibName: nil, bundle: nil)
    }

    public func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }

}


import UIKit
import SpriteKit
class DBreathViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bgview = UIView()
        bgview.frame = CGRect.init(x: 50, y: 100, width: 300, height: 400)
        bgview.backgroundColor = .black
        view.addSubview(bgview)

        
        let hview = UIImageView()
        hview.frame = CGRect.init(x: 150, y: 250, width: 100, height: 100)
        hview.backgroundColor = .clear
        hview.image = UIImage.init(named: "ghost")
        bgview.addSubview(hview)
        
        let skView = SKView(frame: bgview.frame)
        skView.backgroundColor = .clear
        bgview.insertSubview(skView, at: 0)
        let scene = SKScene(size: skView.frame.size)
        scene.backgroundColor = .clear
        scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        let emitterNode = SKEmitterNode(fileNamed: "MySmokeParticle")
        let emitterNode1 = SKEmitterNode(fileNamed: "MyFireParticle")
        
        scene.addChild(emitterNode!)
        scene.addChild(emitterNode1!)
        skView.presentScene(scene)
        
        // 4.GCD 主线程/子线程
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            emitterNode?.particleAlpha = 0
        }
        
    }
    

}
