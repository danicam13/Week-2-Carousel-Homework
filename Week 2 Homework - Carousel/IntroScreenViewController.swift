//
//  IntroScreenViewController.swift
//  Week 2 Homework - Carousel
//
//  Created by Camous, Dani on 8/29/16.
//  Copyright © 2016 Dani Camous. All rights reserved.
//

import UIKit

class IntroScreenViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var tile1View: UIImageView!
    @IBOutlet weak var tile2View: UIImageView!
    @IBOutlet weak var tile3View: UIImageView!
    @IBOutlet weak var tile4View: UIImageView!
    @IBOutlet weak var tile5View: UIImageView!
    @IBOutlet weak var tile6View: UIImageView!
    
//    var yOffsets : [CGFloat] = [-285, -240, -415, -408, -480, -500]
//    var xOffsets : [CGFloat] = [-30, 75, -66, 10, -200, -15]
//    var scales : [CGFloat] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
//    var rotations : [CGFloat] = [-10, -10, 10, 10, 10, -10]
    
    var xOffsets : [CGFloat] = [-40, 55, 36, 95, -120, -65]
    var yOffsets : [CGFloat] = [-285, -260, -445, -428, -530, -530]
    var scales : [CGFloat] = [1.1, 1.7, 1.6, 1.8, 1.9, 1.7]
    var rotations : [CGFloat] = [-20, -18, 15, 15, 15, -15]
    
    func convertValue(value: CGFloat, r1min: CGFloat, r1max: CGFloat, r2min: CGFloat, r2max: CGFloat) -> CGFloat {
        var ratio = (r2max-r2min) / (r1max-r1min)
        return value * ratio + r2max - r1min * ratio
    }
    
    func transformView(view: UIView!, atIndex index: Int, offset: CGFloat){ }
    
    func updateViewTransformWithOffset(offset: CGFloat){ }
    
    @IBAction func onSignIn(sender: AnyObject) { }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        scrollView.contentSize = CGSize(width: 320, height: 1260)
        scrollView.contentSize = imageView.image!.size
        scrollView.delegate = self
        
        scrollView.sendSubviewToBack(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var offset = CGFloat(scrollView.contentOffset.y)
        var tx = convertValue(offset, r1min: 0, r1max: 568, r2min: -40, r2max: 0)
        var ty = convertValue(offset, r1min: 0, r1max: 568, r2min: -285, r2max: 0)
        
        tile1View.transform = CGAffineTransformMakeTranslation(tx, ty)
        print("contentoffset \(offset)")
        
    }
    
   
        
       /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

