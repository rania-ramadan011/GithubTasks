//
//  TableViewCell.swift
//  RobustaTask
//
//  Created by mac on 17/04/2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
   
   //Mark:-OUtlet
    @IBOutlet weak var repoDate: UILabel!
    @IBOutlet weak var repoOwnerName: UILabel!
    @IBOutlet weak var repoImage: UIImageView!
    @IBOutlet weak var repoNameLabel: UILabel!
    
   //Mark:-Methods
    
    func setCell(model:RepoModel){
        repoOwnerName.text = model.owner?.login
        repoNameLabel.text = model.name
        repoImage.load(url:model.owner?.avatarURL ?? "https://avatars.githubusercontent.com/u/1?v=4")
        repoImage.makeRounded()
       
    }

    
}
extension UIImageView {
    func load(url: String) {
        guard let url = URL(string: url) else {return}
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

