//
//  DetailViewController.swift
//  RandomColorSwift
//
//  Created by WANG WEI on 2015/01/23.
//  Copyright (c) 2016年 OneV's Den. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var color: UIColor?
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var colorNameLabel: UILabel!
    @IBOutlet weak var colorHexLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10;
        colorView.layer.masksToBounds = true;
        
        colorView.backgroundColor = color
        colorNameLabel.text = color?.name
        colorHexLabel.text = color?.hexString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
