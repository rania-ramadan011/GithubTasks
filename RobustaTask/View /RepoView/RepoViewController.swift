//
//  ViewController.swift
//  RobustaTask
//
//  Created by mac on 15/04/2021.
//

import UIKit

class RepoViewController: UIViewController {
    
    //Mark:- Outlet
    
    @IBOutlet weak var SearchBtn: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var repoTableView: UITableView!
    @IBOutlet weak var searchResultLabel: UILabel!
    
    //Mark:- Variables
    let presenter = RepoPresenter()
    var repoArr:[RepoModel]=[]
    var searchRepoList:[RepoModel]=[]
    var isDataLoading:Bool=false
    var pageNo:Int=1
    var limit:Int=20
    var offset:Int=0
    var connectionCount:Int=0
    var tempArr:[RepoModel]=[]
    var activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    
    //Mark:- Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        presenter.setViewDelegate(repoViewDelegate: self)
        registerTableViewCell()
        repoTableView.tableFooterView=activityIndicator
        presenter.getRepos()
        
    }
    
    func registerTableViewCell(){
        let cellNib = UINib(nibName:"TableViewCell", bundle: nil)
        self.repoTableView.register(cellNib, forCellReuseIdentifier: "TableViewCell")
    }
    
    
    func setDelegates(){
        searchTextField.delegate = self
        repoTableView.dataSource = self
        repoTableView.delegate = self
    }
    
    @IBAction func searchBtnDidTap(_ sender: Any) {
        restSearch()
        let searchRepoText = searchTextField.text
        if !((searchRepoText?.isEmpty)!){
            for item in repoArr{
                if let name = item.name {
                    if name.contains(searchRepoText ?? ""){
                        searchRepoList.append(item)
                        
                    }
                }
                
            }
            if searchRepoList.isEmpty{
                searchResultLabel.text = "No Result Found"
            }else{
                repoArr.removeAll()
                tempArr.removeAll()
                sendData(RepoArr:searchRepoList)
                searchTextField.text = ""
            }
          
            
        }
        
    }
    
    func restSearch(){
        searchRepoList.removeAll()
        searchResultLabel.text  = ""
    }
    
    func addRepoList(offset:Int,limit:Int){
        if self.repoArr.count > limit{
            
            for i in offset..<limit{
                tempArr.append(repoArr[i])
            }
            self.repoTableView.reloadData()
        }else{
            for i in offset..<self.repoArr.count{
                tempArr.append(repoArr[i])
            }
            self.repoTableView.reloadData()
            self.repoTableView.tableFooterView?.isHidden=true
            self.isDataLoading = true
            
        }
        
    }
}
extension RepoViewController: UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            
            return false
        }
    }
    
}


extension RepoViewController:RepoViewDelegate{
    
    func sendData(RepoArr:[RepoModel]) {
        
            if RepoArr.count > 20 {
                for i in 0..<20{
                    self.tempArr.append(RepoArr[i])
                }
            }else{
                for i in 0..<RepoArr.count{
                    self.tempArr.append(RepoArr[i])
                }
                
            }
            
            for item in RepoArr{
                repoArr.append(item)
           
        }
        
        
        DispatchQueue.main.async { [weak self] in
            self?.repoTableView.reloadData()
        }
    }
    
    
}
extension RepoViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell {
            cell.setCell(model: (repoArr[indexPath.row]))
            return cell
        }
        return TableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "DetailsView", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "DetailsViewViewController") as? DetailsViewViewController
        vc?.repoModel = repoArr[indexPath.row]
        self.navigationController?.pushViewController(vc ?? DetailsViewViewController(), animated: true)
        
    }
    
}
extension RepoViewController:UIScrollViewDelegate{
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        
        if ((repoTableView.contentOffset.y + repoTableView.frame.size.height) >= repoTableView.contentSize.height)
        {
            if !isDataLoading{
                DispatchQueue.main.async {
                    self.activityIndicator.startAnimating()
                }
                
                if repoArr.count > 20 {
                    self.offset=tempArr.count
                    self.limit=self.offset+20
                    
                    
                    addRepoList(offset: self.offset, limit: self.limit)
                    
                }
                
            }
            
            
        }
        
        
    }
    
}
