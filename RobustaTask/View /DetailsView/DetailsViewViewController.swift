//
//  DetailsViewViewController.swift
//  RobustaTask
//
//  Created by mac on 17/04/2021.
//

import UIKit

class DetailsViewViewController: UIViewController {
    
    //Mark:- Outlet
    @IBOutlet weak var repoLabelName: UILabel!
    @IBOutlet weak var ownerName: UILabel!
    
    //Mark:- Variables
    var repoModel:RepoModel?
    
    //Mark:- Methods
    
    override func viewDidLoad() {
        setLabels()
    }
    
    func setLabels(){
        repoLabelName.text = repoModel?.name
        ownerName.text = repoModel?.owner?.login
    }
    
}
