import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tablView: UITableView!
    @IBOutlet weak var musicNumberStackView: UIStackView!
    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var miniPlayerImage: UIImageView!
    @IBOutlet weak var miniPlayerTitle: UILabel!
    @IBOutlet weak var miniPlayerType: UILabel!
    @IBOutlet weak var miniPlayer: UIView!
    @IBAction func miniPlayerCancelButtonTapped(_ sender: UIButton) {
        miniPlayer.isHidden = true
    }
    var items: [Item] = []
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //yeh miniplayer hidden h ya nhi uske liye
        miniPlayer.isHidden = true

        
        let backgroundImage = UIImage(named: "BackgroundImage")
        view.backgroundColor = UIColor(patternImage: backgroundImage!)
        navigationView.layer.cornerRadius = 20
        musicNumberStackView.layer.cornerRadius = 23
        
        miniPlayer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            miniPlayer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0), // Align to bottom without safe area
            miniPlayer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            miniPlayer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            miniPlayer.heightAnchor.constraint(equalToConstant: 90) // Double the height
        ])

        
        tablView.register(UINib(nibName: "CustomCellTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        tablView.dataSource = self
        tablView.delegate = self
        
        loadItems()
    }
    
    //yeh parse karane ke liye json ko item ke andar
    func loadItems() {
        guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
            print("Error: JSON file not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            items = try JSONDecoder().decode([Item].self, from: data)
            tablView.reloadData()
        } catch {
            print("Error decoding JSON:", error)
        }
    }

}


extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCellTableViewCell
        let item = items[indexPath.section].items[indexPath.row]
        
        //cell ke labels yahi se set kardiye
        cell.titleLabel.text = item.title
        cell.typeLabel.text = item.type
        cell.locationLabel.text = item.location
        cell.accessoryButton.setImage(UIImage(named: item.imageName), for: .normal)
        
        //cell me jo play button he uske tap se miniplayer configure ho jayega and visible ho jayega
        cell.accessoryButtonTapHandler = {
            self.miniPlayerTitle.text = item.title
            self.miniPlayerType.text = item.type
            self.miniPlayerImage.image = UIImage(named: item.imageName)
            self.miniPlayer.isHidden = false
        }
        
        return cell
    }
}

//yeh datewise sections ke liye
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
        let titleLabel = UILabel(frame: CGRect(x: 16, y: 10, width: tableView.frame.width, height: 15))
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textColor = .buttonColorGrey
        titleLabel.text = items[section].date
        headerView.addSubview(titleLabel)
        return headerView
    }
}


