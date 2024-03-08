//
//  ViewController.swift
//  discoveriesTask-Priyanshu
//
//  Created by Zignuts Technolab on 08/03/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tablView: UITableView!
    @IBOutlet weak var musicNumberStackView: UIStackView!
    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var mainView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = .blue
        tablView.dataSource = self
        let backgroundImage = UIImage(named: "BackgroundImage")
        view.backgroundColor = UIColor(patternImage: backgroundImage!)
        mainView.backgroundColor = .clear
        navigationView.layer.cornerRadius = 20
        navigationView.clipsToBounds = true
        // Do any additional setup after loading the view.
        
        musicNumberStackView.layer.cornerRadius = 23
        musicNumberStackView.clipsToBounds = true
        musicNumberStackView.layoutMargins = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        musicNumberStackView.isLayoutMarginsRelativeArrangement = true
        
        
        // Register custom cell
        tablView.register(UINib(nibName: "CustomCellTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
       
                
    
        
        
    }
    

    
        
        // MARK: - UITableViewDataSource
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 5
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCellTableViewCell
        return cell
    }


    


}

