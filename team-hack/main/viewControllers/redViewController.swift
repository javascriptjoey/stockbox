//
//  redViewController.swift
//  team-hack
//
//  Created by Joey Essak on 5/26/21.
//
import Combine
import UIKit

struct User:Decodable {
    let name: String
    let company: Company
}

struct Company:Decodable {
    let name:String
}


class DataManager {
    private let urlString = "https://jsonplaceholder.typicode.com/users"
    
    var usersPublisher:AnyPublisher<[User], Error> {
        let url = URL(string: urlString)!
        return URLSession.shared.dataTaskPublisher(for: url)
        .map { $0.data }
            .decode(type: [User].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}


class SecondCustomTableCell: UITableViewCell{

}

class redViewController: UIViewController, UITableViewDataSource{

    

    private let tableView: UITableView = {
        let table = UITableView()
        table.register(SecondCustomTableCell.self,
                        forCellReuseIdentifier: "secondcell")
        return table
    }()
    
    
    private var usersSubscriber: AnyCancellable?
    
    private var users = [User]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.frame = view.bounds
        tableView.tableFooterView = UIView()
        fetchUsers()
        super.viewDidLoad()
    }
    

    private func fetchUsers() {
        usersSubscriber = DataManager().usersPublisher
            .sink(receiveCompletion: { _ in }, receiveValue: {(users) in
                self.users = users
            })
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "secondcell")
        let user = self.users[indexPath.item]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.company.name
        return cell
    }
}
