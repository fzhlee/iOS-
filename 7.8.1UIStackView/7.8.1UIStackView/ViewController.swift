//
//  ViewController.swift
//  7.8.1UIStackView
//
//  Created by Jerry on 2018/3/13.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var stackView : UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let view1 = UIView()
        let view2 = UIView()
        let view3 = UIView()
        view1.backgroundColor = .red
        view2.backgroundColor = .orange
        view3.backgroundColor = .blue
        
        stackView = UIStackView(arrangedSubviews: [view1, view2, view3])
        stackView.frame = CGRect(x: 0, y: 0, width: 320, height: 400)
        stackView.alignment = UIStackViewAlignment.fill
        stackView.axis = UILayoutConstraintAxis.horizontal
        stackView.distribution = UIStackViewDistribution.fillEqually
        stackView.spacing = 10
        stackView.backgroundColor = .orange
        self.view.addSubview(stackView)
        
        let spaccing = UIButton(type: UIButtonType.roundedRect)
        spaccing.frame = CGRect(x: 20, y: 420, width: 280, height: 30)
        spaccing.setTitle("增加间距", for: .normal)
        spaccing.addTarget(self, action: #selector(setCustomSpacing(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(spaccing)
        
        let insert = UIButton(type: UIButtonType.roundedRect)
        insert.frame = CGRect(x: 20, y: 460, width: 280, height: 30)
        insert.setTitle("插入视图", for: .normal)
        insert.addTarget(self, action: #selector(insertArrangedSubview(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(insert)
        
        let remove = UIButton(type: UIButtonType.roundedRect)
        remove.frame = CGRect(x: 20, y: 500, width: 280, height: 30)
        remove.setTitle("删除视图", for: .normal)
        remove.addTarget(self, action: #selector(removeArrangedSubview(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(remove)
    }
    
    @objc func setCustomSpacing(_ button:UIButton)
    {
        let view = stackView.arrangedSubviews[1]
        stackView.setCustomSpacing(30, after: view)
    }

    @objc func insertArrangedSubview(_ button:UIButton)
    {
        let view = UIView()
        view.backgroundColor = .green
        stackView.insertArrangedSubview(view, at: 2)
    }
    
    @objc func removeArrangedSubview(_ button:UIButton)
    {
        let view = stackView.arrangedSubviews[1]
        stackView.removeArrangedSubview(view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

