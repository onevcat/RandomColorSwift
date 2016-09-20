//
//  SettingViewController.swift
//  RandomColorSwift
//
//  Copyright (c) 2016 Wei Wang (http://onevcat.com)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import UIKit
import RandomColor

protocol SettingViewControllerDelegate: class {
    func settingViewController(_ viewController: SettingViewController, didSetCount count: Int, hue: Hue, luminosity: Luminosity)
}

class SettingViewController: UITableViewController {
    //MARK: Color variables
    var count: Int = 99 {
        didSet {
            countLabel?.text = String(count)
        }
    }
    var hue: Hue = .random {
        didSet {
            hueLabel?.text = "\(hue)"
        }
    }
    
    var luminosity: Luminosity = .light
    
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
    
    @IBAction func doneButtonPressed(_ sender: AnyObject) {
        delegate?.settingViewController(self, didSetCount: count, hue: hue, luminosity: luminosity)
    }
    
    @IBAction func countSliderValueChanged(_ slider: UISlider) {
        count = Int(slider.value)
    }
    
    @IBAction func stepperValueChanged(_ stepper: UIStepper) {
        hue = Hue.fromInt(Int(stepper.value))
    }
    
    @IBAction func segmentValueChanged(_ segment: UISegmentedControl) {
        if let value = Luminosity(rawValue: segment.selectedSegmentIndex) {
            luminosity = value
        }
    }
}
