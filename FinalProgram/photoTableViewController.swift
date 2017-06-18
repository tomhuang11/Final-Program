//
//  photoTableViewController.swift
//  FinalProgram
//
//  Created by tom on 2017/6/18.
//  Copyright © 2017年 tom. All rights reserved.
//

import UIKit

class photoTableViewController: UITableViewController {
    var photos:[[String:String]] = []
    var AddDic:[String:String]!
    
    func getAddPhotoNoti(noti:Notification) {
        let movie = noti.userInfo as? [String:String]
        
        photos.insert(movie!, at: 0)
        
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("\(AddDic["title"]).txt")
        (photos as NSArray).write(to: url!, atomically: true)
        
        
        tableView.reloadData()
        
        
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        print(AddDic["title"])
        
        let url = docUrl?.appendingPathComponent("\(AddDic["title"]).txt")
        let array = NSArray(contentsOf: url!)
        if array != nil {
            photos = array as! [[String:String]]
        }
        
        let notiName = Notification.Name("AddPhoto")
        NotificationCenter.default.addObserver(self, selector: #selector(photoTableViewController.getAddPhotoNoti(noti:)), name: notiName, object: nil)
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
        return photos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath)

        // Configure the cell...

        
        let dic = photos[indexPath.row]
        
        cell.textLabel?.text = dic["name"]
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent(dic["photo"]!)
        cell.imageView?.image = UIImage(contentsOfFile: url!.path)
        return cell
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

    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        photos.remove(at: indexPath.row)
        let fileManager = FileManager.default
        let docUrls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("\(AddDic["title"]).txt")
        (photos as NSArray).write(to: url!, atomically: true)
        
        
        tableView.reloadData()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.destination is collectionViewController{
        let controller = segue.destination as! collectionViewController
        controller.images = photos
        }
    }
    

}
