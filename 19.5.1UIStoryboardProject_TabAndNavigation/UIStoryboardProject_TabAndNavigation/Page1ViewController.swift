//
//  Page2ViewController.swift
//  DemoApp
//
//  Created by Jerry on 15/10/15.
//  Copyright © 2015年 TapInfinity. All rights reserved.
//

import UIKit

class Page1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func gotoAnotherStoryboardPage1(_ sender: AnyObject) {
        let storyBoard = UIStoryboard(name: "AnotherStoryboard", bundle: nil)
        let vc = storyBoard.instantiateInitialViewController()
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func gotoAnotherStoryboardPage2(_ sender: AnyObject) {
        let storyBoard = UIStoryboard(name: "AnotherStoryboard", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "islandPage") as! IslandPageViewController
        vc.message = "Greetings!"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "segueToPage2")
        {
            let vc = segue.destination as! Page2ViewController;
            vc.name = "Jerry";
        }
    }
    

}
