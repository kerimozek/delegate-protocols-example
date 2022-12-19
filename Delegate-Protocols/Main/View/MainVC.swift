//
//  ViewController.swift
//  Delegate-Protocols
//
//  Created by Mehmet Kerim ÖZEK on 14.12.2022.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    let postCell = "PostCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(.init(nibName: postCell, bundle: nil), forCellReuseIdentifier: postCell)
        MainVM.shared.delegate = self
        MainVM.shared.getPosts{ errorMessage in
            if let errorMessage = errorMessage {
                print("error \(errorMessage)")
            }
        }
    }

}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        MainVM.shared.post.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: postCell) as! PostCell
        let item = MainVM.shared.post[indexPath.row]
        cell.configureCell(item: item)
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        DetailVC.shared.details = MainVM.shared.post[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
      
}

extension MainVC: MainDelegate {
    func didGetPosts(isDone: Bool) {
        if isDone {
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
            }
        }
    }
    
}
