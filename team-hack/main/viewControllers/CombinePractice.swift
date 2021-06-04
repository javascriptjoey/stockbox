//
//  CombinePractice.swift
//  team-hack
//
//  Created by Joey Essak on 5/24/21.
//
import Combine
import UIKit



class MyCustomTableCell: UITableViewCell{
    //MARK - Button
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPink
        button.setTitle("Button Click: check terminal for responce", for: .normal  )
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    let action = PassthroughSubject<String, Never>()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    @objc private func didTapButton(){
        action.send("Your doing some rad stuff joey")
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    

    override func layoutSubviews() {
        button.frame = CGRect(x: 10, y: 3, width: contentView.frame.size.width-20, height: contentView.frame.size.height-6)
    }
}


class CombinePractice: UIViewController, UITableViewDataSource{

    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(MyCustomTableCell.self,
                        forCellReuseIdentifier: "cell")
        return table
    }()
    
    private var models = [String]()
    
    var observers: [AnyCancellable] = []
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.frame = view.bounds
        
           APICaller.sharred.fetchVideoGames()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("finished")
                case .failure(let error):
                    print(error)
                }
            }, receiveValue: {[weak self] value in
                self?.models = value
                self?.tableView.reloadData()
            }).store(in: &observers)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyCustomTableCell else {
            fatalError()
        }
        cell.action.sink { string in
            print(string)
        }.store(in: &observers)
        return cell
    }
}
