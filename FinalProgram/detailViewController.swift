//
//  detailViewController.swift
//  FinalProgram
//
//  Created by tom on 2017/6/13.
//  Copyright © 2017年 tom. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {
    var DetailDic:[String:String]!
    var isupdate = false
    
    @IBOutlet weak var blogtitle: UILabel!
    @IBOutlet weak var loc: UILabel!
    @IBOutlet weak var content: UITextView!
    
    func getEditBlogNoti(noti:Notification)
    {
        let dic = noti.userInfo as! [String:String]
        content.text = dic["content"]
        isupdate = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        content.text = DetailDic["content"]
        loc.text = DetailDic["loc"]
        blogtitle.text = DetailDic["title"]
        
        
        let notiName = Notification.Name("Editblog")
        NotificationCenter.default.addObserver(self, selector: #selector(getEditBlogNoti(noti:)), name: notiName, object: nil)
        
        // Do any additional setup after loading the view.
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        if isupdate {
            let dic = DetailDic
            let notiName = Notification.Name("Editblog2")
            NotificationCenter.default.post(name: notiName, object: nil, userInfo: dic)
            navigationController?.popViewController(animated: true)
        }
        isupdate = false
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
         if segue.destination is editViewController{
        let controller = segue.destination as! editViewController
        controller.EditDic = DetailDic
        }
        if segue.destination is photoTableViewController{
            let controller = segue.destination as! photoTableViewController
            controller.AddDic = DetailDic
            
        }

    }
    

}
