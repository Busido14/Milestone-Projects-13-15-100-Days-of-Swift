//
//  DetailViewController.swift
//  Milestone Projects 13 - 15
//
//  Created by Артем Чжен on 28/04/23.
//

import UIKit

class DetailViewController: UITableViewController {
    
    var detailItem: CountryData?
    var nameCountry: CountryData?

     override func viewDidLoad() {
         super.viewDidLoad()
         
         title = nameCountry?.country
         navigationController?.navigationBar.prefersLargeTitles = false
         navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(share))
         
     }

     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 10
     }

     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Detail")
         let cell = tableView.dequeueReusableCell(withIdentifier: "Detail", for: indexPath)
         
         switch indexPath.row {
         case 0:
             cell.textLabel?.text = "Capital: \(detailItem!.capital)"
         case 1:
             cell.textLabel?.text = "languages: \(detailItem!.languages)"
         case 2:
             cell.textLabel?.text = "Currency: \(detailItem!.currency)"
         case 3:
             cell.textLabel?.text = "area: \(detailItem!.area)"
         case 4:
             cell.textLabel?.text = "population: \(detailItem!.population)"
         default:
             cell.textLabel?.text = nil
         }
         return cell
    }
    
    @objc func share() {
        var areaShare: String?
        var capitalShare: String?
        if let area = detailItem?.area {
            areaShare = "\(area)"
        }
        if let capital = detailItem?.capital {
            capitalShare = "\(capital)"
        }
        let shares = [areaShare, capitalShare]
        let vc = UIActivityViewController(activityItems: shares as [Any], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
        
    }
    
}
