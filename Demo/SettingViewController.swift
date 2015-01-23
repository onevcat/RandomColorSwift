//
//  SettingViewController.swift
//  RandomColorSwift
//
//  Created by WANG WEI on 2015/01/23.
//  Copyright (c) 2015年 OneV's Den. All rights reserved.
//

import UIKit
import RandomColor

protocol SettingViewControllerDelegate: class {
    func settingViewController(viewController: SettingViewController, didSetCount count: Int, hue: Hue, luminosity: Luminosity)
}

class SettingViewController: UITableViewController {
    //MARK: Color variables
    var count: Int = 99 {
        didSet {
            countLabel?.text = String(count)
        }
    }
    var hue: Hue = .Random {
        didSet {
            hueLabel?.text = "\(hue)"
        }
    }
    
    var luminosity: Luminosity = .Light
    
    //MARK: Delegate
    weak var delegate: SettingViewControllerDelegate?
    
    //MARK: UI Outlets
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var hueLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var segment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //refresh UI
        syncUI()
    }
    
    func syncUI() {
        slider.value = Float(self.count)
        count = Int(slider.value)
        
        stepper.value = Double(hue.toInt())
        hue = Hue.fromInt(Int(stepper.value))
        
        segment.selectedSegmentIndex = luminosity.rawValue
    }
}

//MARK: UI Actions
extension SettingViewController {
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        delegate?.settingViewController(self, didSetCount: count, hue: hue, luminosity: luminosity)
    }
    
    @IBAction func countSliderValueChanged(slider: UISlider) {
        count = Int(slider.value)
    }
    
    @IBAction func stepperValueChanged(stepper: UIStepper) {
        hue = Hue.fromInt(Int(stepper.value))
    }
    
    @IBAction func segmentValueChanged(segment: UISegmentedControl) {
        if let value = Luminosity(rawValue: segment.selectedSegmentIndex) {
            luminosity = value
        }
    }
}