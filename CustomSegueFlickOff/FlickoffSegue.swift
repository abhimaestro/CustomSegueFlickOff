//
// Created by Abhishek Sharma on 3/21/16.
// Copyright (c) 2016 Abhishek Sharma. All rights reserved.
//

import UIKit

class FlickoffSegue : UIStoryboardSegue {

    override func perform() {
        let sourceView = self.sourceViewController.view as UIView!
        let destinationView = self.destinationViewController.view as UIView!
        let screen = UIScreen.mainScreen().bounds.size
        let window = UIApplication.sharedApplication().keyWindow

        destinationView.frame = CGRectMake(0.0, 0.0, screen.width, screen.height)
        window?.insertSubview(destinationView, belowSubview: sourceView)

        UIView.animateWithDuration(1.0,
                delay: 0.0,
                options: UIViewAnimationOptions.CurveEaseOut,
                animations: {
                    () -> Void in
                    sourceView.frame = CGRectOffset(sourceView.frame, -screen.width, -50)
                },
                completion: {
                    (finished) -> Void in
                    self.sourceViewController.presentViewController(self.destinationViewController as UIViewController,
                            animated: false,
                            completion: nil)
                })
    }
}