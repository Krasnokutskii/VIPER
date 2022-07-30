//
//  ViewController.swift
//  Viper
//
//  Created by Yaroslav Krasnokutskiy on 30.7.22..
//

import UIKit
// view controller
// reference presenter
// protocols

protocol AnyView{
    var presenter: AnyPresenter? {get set}
    
    func update(with users: [User])
    func update(with error: Error)
}

final class UserView: UIViewController,AnyView, UITableViewDelegate, UITableViewDataSource{
    
    var presenter: AnyPresenter?
    var users: [User] = []
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .systemBlue
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    func update(with users: [User]){
        
        DispatchQueue.main.async {
            self.users = users
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    func update(with error: Error){
        
    }
    // table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
}
