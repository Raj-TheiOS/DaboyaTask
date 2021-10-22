//
//  PhotosCell.swift
//  DaboyaTask
//
//  Created by Raj Rathod on 22/10/21.
//

import UIKit
import SDWebImage

class PhotosCell: UITableViewCell, ReusableCell {
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }
    
    var object: Photos? {
        didSet {
            authorLabel.text = object?.author ?? ""
            self.imgView.sd_setImage(with: URL(string: object?.download_url ?? ""), placeholderImage: nil)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}



protocol ReusableCell {
    static var identifier: String { get }
    static var nib: UINib { get }
}

extension ReusableCell where Self: UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
