//
//  ViewController.swift
//  SAConfettiView
//
//  Created by Sudeep Agarwal on 12/14/2015.
//  Copyright (c) 2015 Sudeep Agarwal. All rights reserved.
//

import UIKit
import SAConfettiView

class ViewController: UIViewController {
    
    var confettiView: SAConfettiView!
    
    @IBOutlet weak var confettiStatus: UILabel!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var diamondButton: UIButton!
    @IBOutlet weak var confettiButton: UIButton!
    @IBOutlet weak var triangleButton: UIButton!
    @IBOutlet weak var moreImagesButton: UIButton!
    @IBOutlet weak var oneImageButton: UIButton!
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addConfettiView()
        updateConfettiView(true)
    }
    
    @IBAction func starButtonTapped(sender: AnyObject) {
        configureConfettiViewWithType(.Star)
    }
    
    @IBAction func diamondButtonTapped(sender: AnyObject) {
        configureConfettiViewWithType(.Diamond)
    }
    @IBAction func confettiButtonTapped(sender: AnyObject) {
        configureConfettiViewWithType(.Confetti)
    }
    
    @IBAction func triangleButtonTapped(sender: AnyObject) {
        configureConfettiViewWithType(.Triangle)
    }
    
    @IBAction func moreImagesButtonTapped(sender: AnyObject) {
        
        let customImages = [UIImage(named: "donut.png")!, UIImage(named: "hamburger.png")!, UIImage(named: "hotdog.png")!, UIImage(named: "pizza.png")!, UIImage(named: "umbrella.png")!, UIImage(named: "watch.png")!]
        confettiView.customImages = customImages
        configureConfettiViewWithType(.CustomImages)
    }
    
    @IBAction func oneImageButtonTapped(sender: AnyObject) {
        
        confettiView.customImage = UIImage(named: "donut.png")
        configureConfettiViewWithType(.CustomImage)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

        // Check if confettiStatus is touched. (Quick hack :|)
        if !touchedButtonWithTouch(touches.first!) {
            
            if (confettiView.isRaining) {
                
                updateConfettiView(false)
            } else {
                
                updateConfettiView(true)
            }
        }
    }
}

extension ViewController {
    
    func addConfettiView() {
        // Create confetti view
        // Deafult type is confetti
        // Intestity is set to 0.5 by deafult
        confettiView = SAConfettiView(frame: self.view.bounds)
        // Add subview
        view.addSubview(confettiView)
        view.sendSubviewToBack(confettiView)
    }
    
    func touchedButtonWithTouch(touch: UITouch) -> Bool {
        
        if touch.view == starButton || touch.view == diamondButton || touch.view == confettiButton || touch.view == triangleButton || touch.view == moreImagesButton || touch.view == oneImageButton {
            return true
        } else {
            return false
        }
    }
    
    func configureConfettiViewWithType(selectedType: SAConfettiView.ConfettiType) {
        updateConfettiView(false)
        confettiView.type = selectedType
        updateConfettiView(true)
    }
    
    func updateConfettiView(flag: Bool) {
        
        if flag {
            confettiView.startConfetti()
            confettiStatus.text = "it's raining confetti 🙂"
        } else {
            confettiView.stopConfetti()
            confettiStatus.text = "it's not raining confetti 🙁"
        }
    }
}

