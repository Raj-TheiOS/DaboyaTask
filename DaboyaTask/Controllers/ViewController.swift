//
//  ViewController.swift
//  DaboyaTask
//
//  Created by Raj Rathod on 22/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var photosList: UITableView!
    
    var photos = [Photos]()
    let networking = NetworkingService()
    var datasourceTable = GenericDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPhotos()
    }
    
    func getPhotos() {
        networking.request(endpoint: .photos) { (photos: [Photos]) in
            self.photos = photos
            self.setUpTableCell()
            self.photosList.reloadData()
        }
    }

    func setUpTableCell(){
        datasourceTable.emptyMessage = "No Photos Found!"
        datasourceTable.array = self.photos
        datasourceTable.identifier = PhotosCell.identifier
        datasourceTable.height = 250
        photosList.dataSource = datasourceTable
        photosList.delegate = datasourceTable
        photosList.tableFooterView = UIView()
        datasourceTable.configure = {cell, index in
            guard let moviesCell = cell as? PhotosCell else { return }
            moviesCell.object = self.photos[index]
        }

        datasourceTable.didSelect = {cell, index in
            let storyboard  = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
            vc.url = self.photos[index].download_url ?? ""
            self.present(vc, animated: true, completion: nil)
        }
    }
}
