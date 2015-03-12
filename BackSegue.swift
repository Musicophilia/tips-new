//
//  BackSegue.swift
//  tips-new
//
//  Created by Lisa Wang on 3/11/15.
//  Copyright (c) 2015 Lisa Wang. All rights reserved.
//

import UIKit

@objc(BackSegue) class BackSegue: UIStoryboardSegue {
    override func perform() {
        if let controller = sourceViewController.presentingViewController? {
            controller.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}
