//
//  ViewController.swift
//  GB3
//
//  Created by Александр Арсенюк on 23.11.2021.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: [User] = []
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/users")

    override func viewDidLoad() {
        super.viewDidLoad()
        makeRequest()
        configureTableView()
    }
    
    func makeRequest() {
        
        let task = URLSession.shared.dataTask(with: url!) { [weak self] data, response, error in
            guard let data = data else { return }
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                self?.dataSource = users
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            } catch(let error) {
                
                print(error)
            }
        }
        task.resume()
    }

    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let user = dataSource[indexPath.row]
        cell?.textLabel?.text = "\(user.id) \(user.name)"
        return cell ?? UITableViewCell()
    }
    
    
}
