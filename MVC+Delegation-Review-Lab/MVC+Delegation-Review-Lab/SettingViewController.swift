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
            previewFont.text = "Font Size \(String(format: "%0.f", changeStepper.value))"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSlider()
        configureStepper()
    }
    
    func configureStepper() {
        changeStepper.minimumValue = 5.0
        changeStepper.maximumValue = 30.0
        changeStepper.stepValue = 1.0
        changeStepper.value = 16.0
    }
    
    func configureSlider() {
        changeSlider.minimumValue = 5.0
        changeSlider.maximumValue = 30.0
        changeSlider.value = 16.0
    }
    
    @IBAction func sliderTouched(_ sender: UISlider) {
        fontSize = Double(sender.value)
        changeStepper.value = Double(sender.value)

    }
    
    @IBAction func stepperTouched(_ sender: UIStepper) {
        fontSize = sender.value
        changeSlider.value = Float(sender.value)
    }
}
