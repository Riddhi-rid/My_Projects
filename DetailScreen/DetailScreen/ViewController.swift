//
//  ViewController.swift
//  DetailScreen
//
//  Created by admin on 01/10/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var JokeArr:[JokeModel] = []
    
    override func viewWillAppear(_ animated: Bool) {
        ApiManager().RiddhiApiCall { res in
            switch res {
            case .success(let data):
                self.JokeArr.append(contentsOf: data)
                self.TableVC.reloadData()
            case .failure(let err):
                print(err)
            }
        }
    }
 
    

    @IBOutlet weak var TableVC: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        
    }
    func setupTable(){
        
        TableVC.delegate = self
        TableVC.dataSource = self
        TableVC.register(UINib(nibName: "DataCell", bundle: nil),forCellReuseIdentifier: "DataCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        JokeArr.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath) as! DataCell
        cell.punchlineLabel.text=JokeArr[indexPath.row].punchline
        cell.SetLabel.text=JokeArr[indexPath.row].setup
        cell.typeLabel.text=JokeArr[indexPath.row].type
        return cell
    }

}
