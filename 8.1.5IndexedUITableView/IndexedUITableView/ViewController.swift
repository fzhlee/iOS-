//
//  ViewController.swift
//  IndexedUITableView
//
//  Created by Jerry on 16/2/22.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var countries :Dictionary<String, [String]> = ["A": ["Afghanistan", "Albania", "Algeria", "Angola", "Australia", "Austria", "Azerbaijan"], "B":["Bangladesh","Belgium","Bhutan","Bolivia","Brazil","Bahrain","Bulgaria"], "C":["Canada","Congo","Chile","China","Colombia","Cuba"], "D":["Denmark","Djibouti","Dominica"], "E":["Egypt","Estonia","Ethiopia"], "F":["Fiji","Finland","France"], "G":["Gambia","Germany","Greece"], "H":["Haiti","Honduras","Hungary"], "I":["India","Indonesia","Iran","Ireland","Iraq","Italy"], "J":["Jordan","Japan"], "K":["Kazakhstan","Korea","Kuwait"], "L":["Laos","Libya","Lebanon"], "M":["Madagascar","Morocco","Malaysia","Mexico","Mali","Mozambique"], "N":["Nepal","Netherlands","Nigeria","New Zealand"], "O":["Oman"], "P":["Pakistan","Panama","Philippines","Portugal"], "Q":["Qatar"], "R":["Romania","South Africa","Russia"], "S":["Serbia & Montenegro","Senegal","Singapore","Somalia","Switzerland"], "T":["Thailand","Turkmenistan","Tunisia","Turkey"], "U":["United Arab Emirates","United States of America","Uzbekistan"], "V":["Vanuatu","Venezuela","Vietnam"], "Y":["Yemen"], "Z":["Zambia","Zimbabwe"]]
    
    var keys:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        keys = Array(countries.keys).sorted()

        let screenRect = UIScreen.main.bounds
        let tableRect = CGRect(x: 0, y: 20, width: screenRect.size.width, height: screenRect.size.height - 20)
        let tableView = UITableView(frame: tableRect)
        
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        let subCountries = countries[keys[section]]
        return (subCountries?.count)!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return keys
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "reusedCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        
        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        
        let subCountries = countries[keys[(indexPath as NSIndexPath).section]]
        cell?.textLabel?.text = subCountries![(indexPath as NSIndexPath).row]
        
        return cell!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

