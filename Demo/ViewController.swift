//
//  ViewController.swift
//  RandomColorSwift
//
//  Copyright (c) 2015 Wei Wang (http://onevcat.com)
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
            let settingVC = (segue.destinationViewController as! UINavigationController).topViewController as! SettingViewController
            settingVC.delegate = self
            settingVC.count = count
            settingVC.hue = hue
            settingVC.luminosity = luminosity
        } else if segue.identifier == "showDetail" {
            if let indexPath = collectionView?.indexPathForCell(sender as! UICollectionViewCell) {
                let detailVC = segue.destinationViewController as! DetailViewController
                detailVC.color = colors[indexPath.row]
            }
        }
    }
    
    func refresh() {
        colors = randomColorsCount(count, hue: hue, luminosity: luminosity)
        collectionView?.reloadData()
    }
}

//MARK: Collection View DataSource
extension ViewController {
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        cell.contentView.backgroundColor = colors[indexPath.row]
        return cell
    }
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