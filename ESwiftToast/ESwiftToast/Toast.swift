//
//  Toast.swift
//  ToastDemo
//
//  Created by 童进 on 15/8/11.
//  Copyright (c) 2015年 qefee. All rights reserved.
//

import UIKit

/// toast class
public class Toast {
    
    public static var toasts: Array<UIButton> = []
    
    public class func make(text:String) -> ToastView {
        
        let toast = ToastView(text: text)
        
        toast.addTarget(toast, action: #selector(toast.toastTaped(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        NSNotificationCenter.defaultCenter().addObserver(toast, selector: #selector(ToastView.deviceOrientationDidChanged(_:)), name: UIDeviceOrientationDidChangeNotification, object: UIDevice.currentDevice())
        
        return toast
    }
    
    /// show toast
    public class func show(message: String, duration: NSTimeInterval, position: ToastPosition, tapAction: ((ToastView) -> Void)? = nil) {
        
        let toast = Toast.make(message)
        
        toast.duration = duration
        toast.position = position
        toast.tapAction = tapAction
        
        toast.show()
    }
    
    /// show toast
    public class func show(message: String, tapAction: ((ToastView) -> Void)? = nil) {
        show(message, duration: ToastView.DEFAULT_DISPLAY_DURATION, position: ToastPosition.bottom, tapAction: tapAction)
    }
    
    /// show toast
    public class func show(message: String, duration: NSTimeInterval, tapAction: ((ToastView) -> Void)? = nil) {
        show(message, duration: duration, position: ToastPosition.bottom, tapAction: tapAction)
    }
}