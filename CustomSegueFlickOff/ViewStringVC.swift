//
//  ViewStringVC.swift
//  CustomSegueFlickOff
//
//  Created by Abhishek Sharma on 3/21/16.
//  Copyright © 2016 Abhishek Sharma. All rights reserved.
//
import UIKit

class ViewStringVC: UIViewController {

    private var rightToLeft = true
    private let _showStringSegueUnwind = "showStringSegueUnwind"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = ColorWheel().randomColor()

        addGestures()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    private func addGestures(){

        let leftSwipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "swipeLeft")
        leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(leftSwipeGestureRecognizer)

        let rightSwipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "swipeRight")
        rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(rightSwipeGestureRecognizer)
    }

    func swipeLeft(){
        rightToLeft = false
        self.performSegueWithIdentifier(_showStringSegueUnwind, sender: self)
    }

    func swipeRight(){
        rightToLeft = true
        self.performSegueWithIdentifier(_showStringSegueUnwind, sender: self)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == _showStringSegueUnwind {
            if let flickOffSegueUnwind = segue as? FlickoffSegueUnwind {
                flickOffSegueUnwind.rightToLeftDirection = self.rightToLeft
            }
        }
    }
}