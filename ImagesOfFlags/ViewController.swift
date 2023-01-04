//
//  ViewController.swift
//  ImagesOfFlags
//
//  Created by Amr El-Fiqi on 04/01/2023.
//

import UIKit




class ViewController: UITableViewController {
    var flags = [String]()
   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        title = "Countries"
        
        navigationController?.navigationBar.prefersLargeTitles = true
       for item in items {
           if item.hasSuffix("png"){
               flags.append(item)
        
           }
       }

    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        cell.textLabel?.text =  flags[indexPath.row]
        cell.imageView?.image = UIImage(named: flags[indexPath.row])
        
        cell.backgroundColor = UIColor.init(white: 0.85, alpha: 1)
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 0.2
        cell.layer.cornerRadius = 2
        cell.clipsToBounds = true
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Choosen") as? DetailViewController
        {
            vc.imageToView = flags[indexPath.row]
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
   
    
}

