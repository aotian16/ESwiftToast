# ESwiftToast
An android like toast lib write in swift

<img src="https://github.com/aotian16/ESwiftToast/blob/master/screen_shot.git" width="188px" height="334px" />

# install
| No.  | type     | detail                                   |
| ---- | -------- | ---------------------------------------- |
| 1    | carthage | `github "aotian16/ESwiftToast" ~> 1.0.0` |
| 2    | manual   | just copy *.swift to your project.       |



# use

            Toast.show("message1")
            Toast.show("message2", duration: 4, tapAction: nil)
            Toast.show("message3", duration: 4, tapAction: {(toast) in
                print("message3 clicked")
                toast.hide()
            })
            Toast.show("a very loooooooooooooooooooooooooooooooooooooooooooooooooooooooooog toast. \(i)")
            
            // custom
            let toast = Toast.make("message4")
            toast.duration = 3
    //        toast.offset = 40
            toast.tapAction = {(toast) in
                print("message4 clicked")
                toast.hide()
            }
    //        toast.toastOffset = 1
            toast.show()

# license
MIT
