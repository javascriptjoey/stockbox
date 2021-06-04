//
//  CoolAnimationViewController.swift
//  team-hack
//
//  Created by Joey Essak on 6/3/21.
//

import UIKit
import ViewAnimator

class CoolAnimationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    private let myTable = UITableView()
    let data = ["Animation effect: 01","Animation effect: 02","Animation effect: 03","Animation effect: 04"]
    
    
    // MARK: - ViewdidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myTable)
        myTable.frame = view.bounds
        myTable.register(UITableViewCell.self, forCellReuseIdentifier: "coolAnimationCell")
        myTable.delegate = self
        myTable.dataSource = self
        
    }

    // MARK: - ViewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let animation = AnimationType.from(direction: .top, offset: 300)
        UIView.animate(views: myTable.visibleCells, animations: [animation],duration: 3 )
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coolAnimationCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        }
        cell.textLabel?.textColor = .white
        return cell
    }
 
 // Increased tableViews row height to make it easy to select
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let vc = FirstViewController()
           
            present(vc, animated: true)
        }
        else if indexPath.row == 1 {
            let vc = SecondViewController()
            
            present(vc, animated: true)
        }
        else if indexPath.row == 2 {
            let vc = ThirdViewController()
          
            present(vc, animated: true)
            
        }
        else {
            let vc = RandomViewController()
          
            present(vc, animated: true)
            
        }
        
        
    }
}

 
