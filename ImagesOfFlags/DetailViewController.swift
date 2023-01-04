//
//  DetailViewController.swift
//  ImagesOfFlags
//
//  Created by Amr El-Fiqi on 04/01/2023.
//

import UIKit

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

class DetailViewController: UIViewController {
    @IBOutlet var selectedImage: UIImageView!
    var imageToView: String?
    var internalTitle: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        internalTitle = imageToView?.replacingOccurrences(of: ".png", with: "").capitalizingFirstLetter()
        title = internalTitle
        navigationItem.largeTitleDisplayMode = .never
        // Do any additional setup after loading the view.
        if let imageToLoad = imageToView {
            selectedImage.image = UIImage(named: imageToLoad)
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
