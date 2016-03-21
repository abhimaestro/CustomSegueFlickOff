//
//  CardCoverVC.swift
//  CustomSegueFlickOff
//
//  Created by Abhishek Sharma on 3/21/16.
//  Copyright © 2016 Abhishek Sharma. All rights reserved.
//

import UIKit

class CardCoverVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addGesture()
    }

    private func addGesture(){
        let swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "segueToViewString")
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeGestureRecognizer)
    }

    func segueToViewString(){
        self.performSegueWithIdentifier("showStringSegue", sender: self)
    }

    @IBAction func returFromFlickoffSegue(sender: UIStoryboardSegue){

    }
}
