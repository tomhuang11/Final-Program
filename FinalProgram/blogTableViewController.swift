//
//  blogTableViewController.swift
//  FinalProgram
//
//  Created by tom on 2017/6/13.
//  Copyright © 2017年 tom. All rights reserved.
//

import UIKit

class blogTableViewController: UITableViewController {
    var blog = [["loc":"taipei","title":"Hello taipei","content":"hello 11111111"]]
    var isupdate = false
    override func viewDidAppear(_ animated: Bool) {
        //super.viewDidAppear(animated)
        if isupdate{
            let indexPath = IndexPath(row: 0, section:0)
            self.tableView.insertRows(at:[indexPath],with: UITableViewRowAnimation.automatic)
            isupdate = false
        }
        
        
        let fileManager = FileManager.default
        let docUrls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("my.txt")
        (blog as NSArray).write(to: url!, atomically: true)
        
        
    }
    
    func getEditLoverNoti(noti:Notification)
    {
        let dic = noti.userInfo as! [String:String]
        blog[tableView.indexPathForSelectedRow!.row] = ["loc":dic["loc"]!,"title":dic["title"]!,"content":dic["content"]!]
        

        
        
        tableView.reloadData()
    }
    
    
    func getAddBlogNoti(noti:Notification)
    {
        let dic = noti.userInfo as! [String:String]
        self.blog.insert(dic, at: 0)
        isupdate = true

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let notiName = Notification.Name("Addblog")
        let notiName2 = Notification.Name("Editblog")
        NotificationCenter.default.addObserver(self, selector: #selector(getAddBlogNoti(noti:)), name: notiName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(getEditLoverNoti(noti:)), name: notiName2, object: nil)
        
        let fileManager = FileManager.default
        let docUrls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("my.txt")
        blog = NSArray(contentsOf: url!) as! [Dictionary<String, String>]
        
        
        
        
       // let fileManager = FileManager.default
      //  let docUrls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
     //   let docUrl = docUrls.first
      //  let url = docUrl?.appendingPathComponent("my.txt")
        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return blog.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "blog", for: indexPath) as! blogTableViewCell
        let dic = blog[indexPath.row]
        cell.blogtitle.text = dic["title"]
        cell.bloglocation.text = dic["loc"]
        cell.blogimage.image = UIImage(named: dic["loc"]!)
        // Configure the cell...
        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        blog.remove(at: indexPath.row)
        let fileManager = FileManager.default
        let docUrls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("my.txt")
        (blog as NSArray).write(to: url!, atomically: true)
        
        
        tableView.reloadData()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let indexPath = tableView.indexPathForSelectedRow
        if segue.identifier != "addnew"
        {
            if segue.destination is detailViewController{
                let controller = segue.destination as! detailViewController
                controller.DetailDic = blog[indexPath!.row]
        }

        }
    }
    

}
