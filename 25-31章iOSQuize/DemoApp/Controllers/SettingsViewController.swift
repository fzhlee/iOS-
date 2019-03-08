//
//  SettingsViewController.swift
//  DemoApp
//
//  Created by Jerry on 2018/2/2.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class SettingsViewController: BaseViewController,UITableViewDelegate, UITableViewDataSource {

    var icons : Array<String>!
    var titles : Array<String>!
    var subTitles : Array<String>!
    var links : Array<String>!
    let host = "https://itunes.apple.com/cn/app/"
    let appsLink = "https://www.coolketang.com/apps.php"
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var buyIAP: UIButton!
    @IBOutlet weak var restoreIAP: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.initData()
        
        self.bgView.layer.cornerRadius = 10
        self.bgView.layer.masksToBounds = true
        
        self.buyIAP.layer.cornerRadius = 10
        self.restoreIAP.layer.cornerRadius = 10
    }
    
    func initData()
    {
        icons = ["iconProductXcode", "iconProductSwift", "iconProductGithub", "iconProductExcel", "iconProductPs", "iconProductAi"]
        titles = ["互动教程 for Xcode9" ,"Swift4.0互动教程" ,"iOS开发中的神兵利器" ,"Excel互动教程" ,"Photoshop互动教程" ,"illustrator互动教程"]
        subTitles = ["手把手学习iOS开发IDE软件","Swift详解及iOS应用实战教程","讲解GitHub中的iOS开发热门项目",
                     "手把手学习Excel电子表格","手把手学习Photoshop CC","手把手学习Illustrator CC"]
        links = ["id1063100471","id1320746678","id1209739676","id1090726089","id680139052","id1005557436"]
        
        Alamofire.request(appsLink).responseObject {
            (response: DataResponse<Apps>) in
            
            let appsResponse = response.result.value
            self.icons = appsResponse?.icons?.components(separatedBy: ",")
            self.titles = appsResponse?.titles?.components(separatedBy: ",")
            self.subTitles = appsResponse?.subTitles?.components(separatedBy: ",")
            self.links = appsResponse?.links?.components(separatedBy: ",")
            self.tableView.reloadData()
        }
 
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "reusedCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        let row = indexPath.row
        let icon = cell.viewWithTag(1) as! UIImageView
        let titleLabel = cell.viewWithTag(2) as! UILabel
        let subTitleLabel = cell.viewWithTag(3) as! UILabel
        let newImage = cell.viewWithTag(4) as! UIImageView
        
        if(row > 1)
        {
            newImage.isHidden = true
        }
        else
        {
            newImage.isHidden = false
        }
        
        icon.image = UIImage(named: "\(icons[row])")
        titleLabel.text = titles[row]
        subTitleLabel.text = subTitles[row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let link = self.links[row]
        let url = URL(string: "\(self.host)\(link)")
        //print(url)
        UIApplication.shared.openURL(url!)
    }
    
    @IBAction func buyIAP(_ sender: AnyObject)
    {
        IAP.shared.purchase()
    }
    
    @IBAction func restoreIAP(_ sender: AnyObject)
    {
        IAP.shared.restorePurchases()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
