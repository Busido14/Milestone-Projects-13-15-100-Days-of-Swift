//
//  ViewController.swift
//  Milestone Projects 13 - 15
//
//  Created by Артем Чжен on 27/04/23.
//

import UIKit

class ViewController: UITableViewController {
    var contries = [CountryData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Contries"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        if let data = load(filename: "countries") {
            contries = data
        } else {
            print("Failed to load data.")
        }
        print(contries)
        
    }
    
    func load(filename: String) -> [CountryData]? {
        if let fileLocation = Bundle.main.url(forResource: "countries", withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode(DataLoader.self, from: data)
                return dataFromJson.results
                
            } catch {
                print(error)
            }
        }
        return nil
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableView", for: indexPath)
        let country = contries[indexPath.row]
        cell.textLabel?.text = country.country
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = contries[indexPath.row]
        vc.nameCountry = contries[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}


