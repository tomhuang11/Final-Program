//
//  addViewController.swift
//  FinalProgram
//
//  Created by tom on 2017/6/13.
//  Copyright © 2017年 tom. All rights reserved.
//

import UIKit

class addViewController: UIViewController {

    @IBOutlet weak var addtitle: UITextField!
    @IBOutlet weak var addloc: UITextField!
    @IBOutlet weak var addcontent: UITextView!
    
    @IBAction func Done(_ sender: Any) {
        if addtitle.text?.characters.count == 0
        {
            let controller = UIAlertController(title: "提醒", message: "請輸入標題", preferredStyle: UIAlertControllerStyle.alert)
            
            let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
                
            })
            controller.addAction(action)
            
            present(controller, animated: true, completion: nil)
            
            return
        }
        if addloc.text?.characters.count == 0
        {
            let controller = UIAlertController(title: "提醒", message: "請輸入地點", preferredStyle: UIAlertControllerStyle.alert)
            
            let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
                
            })
            controller.addAction(action)
            
            present(controller, animated: true, completion: nil)
            
            return
        }
        
        
        let dic = ["title":addtitle.text,"loc":addloc.text,"content":addcontent.text]
        let notiName = Notification.Name("Addblog")
        NotificationCenter.default.post(name: notiName, object: nil, userInfo: dic)
        navigationController?.popViewController(animated: true)
        
        let fileManager = FileManager.default
        let docUrls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("my.txt")
        let array = [dic]
        (array as NSArray).write(to: url!, atomically: true)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
