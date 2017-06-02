//
//  ViewController.swift
//  tableView_dataDinamis
//
//  Created by Luthfi Fathur Rahman on 5/18/17.
//  Copyright © 2017 Luthfi Fathur Rahman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        let prodVC = segue.destination as! TableViewController
        
        if segue.identifier == "Seguekat1" {
            prodVC.NamaKategori = "kategori1"
        } else if segue.identifier == "Seguekat2" {
            prodVC.NamaKategori = "kategori2"
        } else if segue.identifier == "Seguekat3" {
            prodVC.NamaKategori = "kategori3"
        } else if segue.identifier == "Seguekat4" {
            prodVC.NamaKategori = "kategori4"
        } else if segue.identifier == "Seguekat5" {
            prodVC.NamaKategori = "kategori5"
        } else if segue.identifier == "Seguekat6" {
            prodVC.NamaKategori = "kategori6"
        }
    }

}

