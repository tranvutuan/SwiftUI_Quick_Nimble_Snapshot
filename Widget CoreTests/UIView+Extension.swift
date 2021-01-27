//
//  UIViewController+Extension.swift
//  TSM Widget CoreTests
//
//  Created by Tony Tran on 2021-01-21.
//  Copyright © 2021 Score Media Ventures. All rights reserved.
//

import UIKit
extension UIViewController {
    func embedInWindow() -> UIWindow {
        let window = UIWindow()
        window.isHidden = false
        window.frame = view.bounds
        window.rootViewController = self
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
        return window
    }
}

