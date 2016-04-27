//
//  Toast.swift
//  ToastDemo
//
//  Created by 童进 on 15/8/11.
//  Copyright (c) 2015年 qefee. All rights reserved.
//

import UIKit

/// toast class
public class ToastView: UIButton {
    
    public static let DEFAULT_DISPLAY_DURATION: NSTimeInterval = 3.0
    public static let DEFAULToffset: CGFloat = 20
    public static let DEFAULT_ANIMATION_DURATION: NSTimeInterval = 0.3
    
    /// text to show
    public var text: String = ""
    
    /// label to show
    public var textLabel: UILabel!
    
    /// duration
    public var duration: NSTimeInterval = ToastView.DEFAULT_DISPLAY_DURATION
    
    /// toast tap action
    public var tapAction: ((ToastView) -> Void)?
    
    /// offset to top or bottom(default is 20)
    public var offset:CGFloat = DEFAULToffset
    
    public var toastOffset:CGFloat = 5
    
    /// positon to show toast(default is bottom)
    public var position = ToastPosition.bottom
    
    /// animation duration
    public var animationDuration = DEFAULT_ANIMATION_DURATION
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(text:String) {
        
        super.init(frame: CGRectMake(0, 0, 0, 0))
        
        self.text = text
        
        let fontSize:CGFloat = 14.0
        let font = UIFont.boldSystemFontOfSize(fontSize)
        
        let textSize: CGSize = NSString(string: text).boundingRectWithSize(CGSizeMake(CGFloat(UIScreen.mainScreen().bounds.width - 40), CGFloat(MAXFLOAT)), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil).size
        
        let textLabel: UILabel = UILabel(frame: CGRectMake(0, 0, textSize.width+12, textSize.height+12))
        self.textLabel = textLabel
        
        textLabel.backgroundColor = UIColor.clearColor()
        textLabel.textColor = UIColor.whiteColor()
        textLabel.textAlignment = NSTextAlignment.Center
        textLabel.font = font
        textLabel.text = text
        textLabel.numberOfLines = 0

        self.frame = CGRectMake(0, 0, textLabel.frame.width, textLabel.frame.height)
        
        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.grayColor().colorWithAlphaComponent(CGFloat(0.5)).CGColor
        self.backgroundColor = UIColor(red: CGFloat(0.2), green: CGFloat(0.2), blue: CGFloat(0.2), alpha: CGFloat(0.75))
        
        self.addSubview(textLabel)
        self.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        
        self.alpha = 0.0
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func deviceOrientationDidChanged(notification:NSNotification) {
        hideAnimation()
    }
    
    /// dissmiss toast
    private func dissmiss() {
        self.removeFromSuperview()
        let index = Toast.toasts.indexOf(self)
        if let i = index {
            Toast.toasts.removeAtIndex(i)
        }
    }
    
    /// action on toast taped
    public func toastTaped(sender: UIButton) {
        if let action = tapAction {
            action(self)
        } else {
            hideAnimation()
        }
    }
    
    /// show toast with animation
    private func showAnimation() {
        
        UIView.animateWithDuration(animationDuration, animations: { () -> Void in
            let count = Toast.toasts.count
            for i in 0..<count {
                let t = Toast.toasts[i]
                let y = -(UIScreen.mainScreen().bounds.height - t.frame.origin.y - t.frame.height - self.offset) - (self.toastOffset + self.frame.height)
                t.transform = CGAffineTransformMakeTranslation(0, y)
            }
            self.alpha = 1.0
            
            Toast.toasts.append(self)
        }) { (finish: Bool) -> Void in
            
        }
    }
    
    private var hideFlag = false
    
    /// hide toast with animation
    func hideAnimation() {
        
        if hideFlag {
            return
        } else {
            hideFlag = true
            
            UIView.animateWithDuration(animationDuration, animations: { () -> Void in
                let toastIndex = Toast.toasts.indexOf(self)
                
                if let tIndex = toastIndex {
                    for i in 0..<tIndex {
                        let t = Toast.toasts[i]
                        let y = -(UIScreen.mainScreen().bounds.height - t.frame.origin.y - t.frame.height - self.offset) + (self.toastOffset + self.frame.height)
                        t.transform = CGAffineTransformMakeTranslation(0, y)
                    }
                } else {
                    print("no such toast!")
                }
                
                self.alpha = 0.0
                
                self.dissmiss()
            }) { (finish: Bool) -> Void in
                
            }
        }
    }
    
    /// show toast by instance
    public func show() {
        
        let window:UIWindow? = UIApplication.sharedApplication().keyWindow
        
        if let w = window {
            switch position {
            case ToastPosition.bottom:
                self.center = CGPointMake(w.center.x, w.frame.height - (self.frame.height/2 + offset))
            case ToastPosition.center:
                self.center = w.center
            default:
                self.center = CGPointMake(w.center.x, self.frame.height/2 + offset)
            }
            w.addSubview(self)
            showAnimation()
            NSTimer.scheduledTimerWithTimeInterval(duration, target: self, selector: #selector(hideAnimation), userInfo: nil, repeats: false)
        }
    }
}
