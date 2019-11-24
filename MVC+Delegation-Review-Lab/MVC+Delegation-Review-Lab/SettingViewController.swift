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
        
    var data: Movie!
    
    var fontSize: Double = 16.0   {
        didSet {
            self.previewFont.text = "Font Size \(String(format: "%0.f", fontSize))"
            defaultFont = fontSize
            changeSlider.value = Float(fontSize)
            changeStepper.value = fontSize
        }
    }
    
    var defaultFont: Double = 16.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fontSize = defaultFont
        configureSlider()
        configureStepper()
    }
    
    
    func configureStepper() {
        changeStepper.minimumValue = 5.0
        changeStepper.maximumValue = 30.0
        changeStepper.stepValue = 1.0
        changeStepper.value = fontSize
    }

    func configureSlider() {
        changeSlider.minimumValue = 5.0
        changeSlider.maximumValue = 30.0
        changeSlider.value = Float(fontSize)
    }

    @IBAction func sliderTouched(_ sender: UISlider) {
        fontSize = Double(sender.value)
//        changeStepper.value = Double(sender.value)
    }
    
    @IBAction func stepperTouched(_ sender: UIStepper) {
        fontSize = sender.value
//        changeSlider.value = Float(sender.value)
    }
}
