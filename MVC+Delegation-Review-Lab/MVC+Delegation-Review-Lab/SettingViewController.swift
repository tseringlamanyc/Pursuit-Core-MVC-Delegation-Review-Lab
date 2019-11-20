//
//  SettingViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Tsering Lama on 11/20/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    
    @IBOutlet weak var changeFontLabel: UILabel!
    @IBOutlet weak var changeSlider: UISlider!
    @IBOutlet weak var changeStepper: UIStepper!
    @IBOutlet weak var previewFont: UILabel!
    @IBOutlet weak var updateButton: UIButton!
    
    
    var fontSize: Double = 16.0 {
        didSet {
            previewFont.text = "Font Size \(changeStepper.value) "
        }
    }
    
    var fontSlide: Float = 16.0 {
        didSet {
            previewFont.text = "Font Size \(String(format: "%0.f", changeSlider.value))"
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSlider()
        configureStepper()
        
    }
    
    func configureStepper() {
        changeStepper.minimumValue = 5.0
        changeStepper.maximumValue = 21.0
        changeStepper.stepValue = 1.0
        changeStepper.value = 14.0
    }
    
    func configureSlider() {
        changeSlider.minimumValue = 5.0
        changeSlider.maximumValue = 21.0
        changeSlider.value = 14.0
    }
    
    
    @IBAction func sliderTouched(_ sender: UISlider) {
        fontSlide = sender.value
        changeStepper.value = Double(sender.value)
    }
    
    
    @IBAction func stepperTouched(_ sender: UIStepper) {
        fontSize = sender.value
        changeSlider.value = Float(sender.value)
    }
    

}
