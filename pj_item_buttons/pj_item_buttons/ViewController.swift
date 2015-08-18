//
//  ViewController.swift
//  pj_item_buttons
//
//  Created by 童进 on 15/8/12.
//  Copyright (c) 2015年 qefee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let item1 = UIBarButtonItem(title: "item1", style: UIBarButtonItemStyle.Done, target: self, action: "onItem1Click:")
        item1.tintColor = UIColor.redColor()
        item1.title = "111"
        let item2 = UIBarButtonItem(title: "item2", style: UIBarButtonItemStyle.Done, target: self, action: "onItem2Click:")
        item2.tintColor = UIColor.greenColor()
        item2.title     = "222"
        
//        println("self = \(self)")
//        println("self.p = \(self.parentViewController)")
//        println("self.p.p = \(self.parentViewController?.parentViewController)")
//        println("self.p.p.p = \(self.parentViewController?.parentViewController?.parentViewController)")
//        println("self.n = \(self.navigationController)")
        
        self.navigationItem.rightBarButtonItems = [item1, item2]
        
        
        
//        self.navigationController?.navigationItem.setRightBarButtonItems([item1, item2], animated: true)
        
//        self.navigationController?.navigationItem.setLeftBarButtonItem(item1, animated: true)
    }
    
    /**
    <#Description#>
    
    :param: sender <#sender description#>
    */
    func onItem1Click(sender: UIBarButtonItem) {
        println("111")
        
        performSegueWithIdentifier("segue1", sender: self)
    }
    
    func onItem2Click(sender: UIBarButtonItem) {
        println("222")
        
        performSegueWithIdentifier("segue2", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

