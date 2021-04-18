//
//  RepoPresenter.swift
//  RobustaTask
//
//  Created by mac on 15/04/2021.
//

import Foundation

protocol RepoViewDelegate:AnyObject {
    func sendData(RepoArr:[RepoModel])
}

class RepoPresenter {
    
   //Mark :-variables
    
   weak private var repoViewDelegate : RepoViewDelegate?
    
    //Mark:-Methods
    
    func setViewDelegate(repoViewDelegate:RepoViewDelegate?){
        self.repoViewDelegate = repoViewDelegate
    }
    
    
    func getRepos(){
        
        ApiService.instance.dataRequest(url:Constants.APIDetails.baseUrl ,objectType: [RepoModel].self, params: nil, method: "Get") {[weak self ] (response) in
            switch response{
            case .success(let RepoModel):
                
                guard let self = self else {return}
                self.repoViewDelegate?.sendData(RepoArr: RepoModel)
                break
                
            case .failure(let error):
                print(error.localizedDescription)
                break
                
            }
        }
       
        
    }
}

