//
//  TableViewController.swift
//  tableView_dataDinamis
//
//  Created by Luthfi Fathur Rahman on 5/18/17.
//  Copyright © 2017 Luthfi Fathur Rahman. All rights reserved.
//

import UIKit
import Alamofire
import Gloss

class TableViewController: UITableViewController {

    var NamaKategori: String!
    var TableData: Array<String> = Array<String>()
    
    struct daftarProduk: Decodable{
        let prodID: Int?
        let prodName: String?
        let prodCat: String?
        init?(json: JSON){
            self.prodID = "id" <~~ json
            self.prodName = "name" <~~ json
            self.prodCat = "category" <~~ json
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        get_data_from_url(url: "http://www.luthfifr.com/tutorialdata/ios/productlist/daftarproduk.php?kategori=\(NamaKategori!)")
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
        return TableData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = TableData[indexPath.row]
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 127.0/255.0, alpha: 1.0)
        } else {
            cell.backgroundColor = UIColor(red: 244.0/255.0, green: 242.0/255.0, blue: 3.0/255.0, alpha: 1.0)
        }

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func get_data_from_url(url:String){
        Alamofire.request(url, method:.get).validate(contentType: ["application/json"]).responseJSON{ response in
            switch response.result{
            case .success(let data):
                guard let value = data as? JSON,
                    let eventsArrayJSON = value["prodlist"] as? [JSON]
                    else { fatalError() }
                let DaftarProduk = [daftarProduk].from(jsonArray: eventsArrayJSON)
                for j in 0 ..< DaftarProduk!.count{
                    self.TableData.append(DaftarProduk![j].prodName!)
                    DispatchQueue.main.async(execute: {
                        self.tableView.reloadData()
                    })
                }
                break
            case .failure(let error):
                print("Error: \(error)")
                break
            }
        }
    }

}
