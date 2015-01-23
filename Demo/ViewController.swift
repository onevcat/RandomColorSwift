//
//  ViewController.swift
//  RandomColorSwift
//
//  Created by WANG WEI on 2015/01/22.
//  Copyright (c) 2015年 OneV's Den. All rights reserved.
//

import UIKit
import RandomColor

class ViewController: UICollectionViewController {

    var colors: [UIColor]!
    
    private var count = 99
    private var hue: Hue = .Random
    private var luminosity: Luminosity = .Light
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refresh()
    }
    
    //MARK: Segue Transition
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSetting" {
            let settingVC = (segue.destinationViewController as UINavigationController).topViewController as SettingViewController
            settingVC.delegate = self
            settingVC.count = count
            settingVC.hue = hue
            settingVC.luminosity = luminosity
        }
    }
    
    func refresh() {
        colors = randomColors(count, hue: hue, luminosity: luminosity)
        collectionView?.reloadData()
    }
}

//MARK: Collection View DataSource
extension ViewController: UICollectionViewDataSource {
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as UICollectionViewCell
        cell.contentView.backgroundColor = colors[indexPath.row]
        return cell
    }
}

//MARK: Collection View Delegate
extension ViewController: UICollectionViewDelegate {
    
}


extension ViewController: SettingViewControllerDelegate {
    
    func settingViewController(viewController: SettingViewController, didSetCount count: Int, hue: Hue, luminosity: Luminosity) {
        dismissViewControllerAnimated(true, completion: nil)
        
        self.count = count
        self.hue = hue
        self.luminosity = luminosity
        
        refresh()
        
    }
}