//
//  ViewController.swift
//  discoveriesTask-Priyanshu
//
//  Created by Zignuts Technolab on 08/03/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource , UITableViewDelegate{

    @IBOutlet weak var tablView: UITableView!
    @IBOutlet weak var musicNumberStackView: UIStackView!
    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var miniPlayerImage: UIImageView!
    @IBOutlet weak var miniPlayerTitle: UILabel!
    
    @IBOutlet weak var miniPlayerType: UILabel!
    @IBAction func miniPlayerPauseButtonTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func miniPlayerCancelButtonTapped(_ sender: UIButton) {
        miniPlayer.isHidden = true
    }
    
    var items: [Item] = []

    @IBOutlet weak var miniPlayer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        miniPlayer.isHidden = true
        navigationController?.navigationBar.backgroundColor = .blue
        tablView.dataSource = self
                tablView.delegate = self
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
       
                
        // Set up constraints for miniPlayer
        miniPlayer.translatesAutoresizingMaskIntoConstraints = false
        let bottomConstraint = miniPlayer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        let leadingConstraint = miniPlayer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        let trailingConstraint = miniPlayer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        let heightConstraint = miniPlayer.heightAnchor.constraint(equalToConstant: 60) // Adjust this value to set the desired height for your miniplayer view
        
        NSLayoutConstraint.activate([bottomConstraint, leadingConstraint, trailingConstraint, heightConstraint])
        
        
        
        // Load and parse JSON data
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
                    do {
                        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                        let decoder = JSONDecoder()
                        items = try decoder.decode([Item].self, from: data)
                        tablView.reloadData()
                    } catch {
                        print("Error reading or parsing JSON:", error)
                    }
                } else {
                    print("JSON file not found.")
                }
        
      
       
        
        
    }
    

    
        
        // MARK: - UITableViewDataSource
        
    func numberOfSections(in tableView: UITableView) -> Int {
            return items.count
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return items[section].items.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCellTableViewCell
            let item = items[indexPath.section].items[indexPath.row]
            cell.titleLabel.text = item.title
            cell.typeLabel.text = item.type
            cell.locationLabel.text = item.location
            cell.accessoryButton.setImage(UIImage(named: item.imageName), for: .normal)
            
            // Handle accessory button tap
            cell.accessoryButtonTapHandler = {
                self.miniPlayerTitle.text = item.title
                self.miniPlayerType.text = item.type
                self.miniPlayerImage.image = UIImage(named: item.imageName)
                self.miniPlayer.isHidden = false
            }
            
            return cell
        }



    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        
        let titleLabel = UILabel(frame: CGRect(x: 16, y: 10, width: tableView.frame.width - 32, height: 20))
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textColor = .black
        titleLabel.text = items[section].date
        headerView.addSubview(titleLabel)
        
        return headerView
    }

//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 40 // Adjust the height as needed
//    }
//    




}

