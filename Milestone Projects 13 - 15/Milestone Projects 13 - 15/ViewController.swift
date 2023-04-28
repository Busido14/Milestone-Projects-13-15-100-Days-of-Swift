//
//  ViewController.swift
//  Milestone Projects 13 - 15
//
//  Created by Артем Чжен on 27/04/23.
//

import UIKit

class ViewController: UITableViewController {
    var contries = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Contries"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        contries += ["Russia", "Spain", "Germany", "Estonia", "Korea", "US", "Monaco", "UAE"]
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableView", for: indexPath)
        cell.textLabel?.text = contries[indexPath.row]
        return cell
    }
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }

}

