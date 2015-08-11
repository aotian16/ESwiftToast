# ESwiftToast
An android like toast lib write in swift

<img src="https://github.com/aotian16/ESwiftToast/blob/master/screen_shot.png" width="188px" height="334px" />

# install
just copy ESwiftToast.swift to your project

# use

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
    
# license
MIT
