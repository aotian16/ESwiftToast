//
//  ViewController.swift
//  ESwiftToastDemo
//
//  Created by 童进 on 15/8/11.
//  Copyright (c) 2015年 qefee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTopButtonClick(sender: UIButton) {
        ESwiftToast.show("top", duration: ESwiftToast.DEFAULT_DISPLAY_DURATION, position: .top)
    }
    
    @IBAction func onCenterButtonClick(sender: UIButton) {
        ESwiftToast.show("center", duration: ESwiftToast.DEFAULT_DISPLAY_DURATION, position: .center)
    }
    
    @IBAction func onBottomButtonClick(sender: UIButton) {
        ESwiftToast.show("bottom")
    }
    
    @IBAction func onActionButtonClick(sender: UIButton) {
        ESwiftToast.show("click to fire action", tapAction: { (toast) -> Void in
            ESwiftToast.show("toast taped", duration: ESwiftToast.DEFAULT_DISPLAY_DURATION, position: .center)
        })
    }
    
    @IBAction func onCustomButtonClick(sender: UIButton) {
        let toast = ESwiftToast.make("click to fire custom action")
        
        toast._offset = 30
        toast._duration = 3
        toast._position = .bottom
        toast._tapAction = {(toast) -> Void in
            ESwiftToast.show("custom toast taped", duration: ESwiftToast.DEFAULT_DISPLAY_DURATION, position: .center)}
        toast._animationDuration = 1
        toast._textLabel.textColor = UIColor.redColor()
        toast._contentView.backgroundColor = UIColor.yellowColor()
        
        toast.innerShow()
    }

}

