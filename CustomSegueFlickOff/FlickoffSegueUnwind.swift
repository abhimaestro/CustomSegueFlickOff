//
// Created by Abhishek Sharma on 3/21/16.
// Copyright (c) 2016 Abhishek Sharma. All rights reserved.
//

import UIKit

class FlickoffSegueUnwind : UIStoryboardSegue {

    var rightToLeftDirection = true

    override func perform() {
        if rightToLeftDirection {
            rightToLeft()
        } else{
            leftToRight()
        }
    }

    private func rightToLeft() {
        let sourceView = self.sourceViewController.view as UIView!
        let destinationView = self.destinationViewController.view as UIView!
        let screen = UIScreen.mainScreen().bounds.size
        let window = UIApplication.sharedApplication().keyWindow

        destinationView.frame = CGRectMake(-screen.width, -50, screen.width, screen.height)
        window?.insertSubview(destinationView, aboveSubview: sourceView)

        UIView.animateWithDuration(1.0,
                delay: 0.0,
                options: UIViewAnimationOptions.CurveEaseOut,
                animations: {
                    () -> Void in
                    destinationView.frame = CGRectOffset(destinationView.frame, screen.width, +50)

                },
                completion: {
                    (finished) -> Void in
                    self.sourceViewController.dismissViewControllerAnimated(false, completion: nil)
                })
    }

    private func leftToRight() {
        let sourceView = self.sourceViewController.view as UIView!
        let destinationView = self.destinationViewController.view as UIView!
        let screen = UIScreen.mainScreen().bounds.size
        let window = UIApplication.sharedApplication().keyWindow

        destinationView.frame = CGRectMake(0.0, 0.0, screen.width, screen.height)
        window?.insertSubview(destinationView, belowSubview: sourceView)
        window?.sendSubviewToBack(destinationView)

        UIView.animateWithDuration(1.0,
                delay: 0.0,
                options: UIViewAnimationOptions.CurveEaseOut,
                animations: {
                    () -> Void in
                    sourceView.frame = CGRectOffset(sourceView.frame, -screen.width, -50)
                },
                completion: {
                    (finished) -> Void in
                    self.sourceViewController.dismissViewControllerAnimated(false, completion: nil)
                })
    }
}
