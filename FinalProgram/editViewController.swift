//
//  editViewController.swift
//  FinalProgram
//
//  Created by tom on 2017/6/17.
//  Copyright © 2017年 tom. All rights reserved.
//

import UIKit

class editViewController: UIViewController {
    var EditDic:[String:String]!
    @IBOutlet weak var editTextField: UITextView!
    @IBAction func Done(_ sender: Any) {
        
        EditDic["content"] = editTextField.text
        
        let notiName = Notification.Name("Editblog")
        print(EditDic["content"])
        NotificationCenter.default.post(name: notiName, object: nil, userInfo: EditDic)
        navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        editTextField.text = EditDic["content"]
        
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
