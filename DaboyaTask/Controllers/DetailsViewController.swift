//
//  DetailsViewController.swift
//  DaboyaTask
//
//  Created by Raj Rathod on 26/10/21.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    var url = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.img.sd_setImage(with: URL(string: url), placeholderImage: nil)

    }

}
