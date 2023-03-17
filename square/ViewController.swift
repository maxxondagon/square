//
//  ViewController.swift
//  square
//
//  Created by Maxim Soloboev on 17.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var animator = UIDynamicAnimator()
    
    lazy var square: UIView = {
        let square = UIView()
        square.backgroundColor = .systemBlue
        square.layer.cornerRadius = 8
        square.translatesAutoresizingMaskIntoConstraints = false
        return square
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(square)
        square.frame = CGRect(x: 0, y:0, width: 100, height: 100)
        square.center = view.center
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: view)
        createAnimation(point: location)
    }
    
    func createAnimation(point: CGPoint) {
        animator = UIDynamicAnimator(referenceView: view)
        let collision = UICollisionBehavior(items: [square])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        let snapBehavior = UISnapBehavior(item: square, snapTo: point)
        snapBehavior.damping = 1
        animator.addBehavior(snapBehavior)
    }
}

