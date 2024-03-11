import UIKit

class CustomCellTableViewCell: UITableViewCell {
    
  
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var accessoryButton: UIButton!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var routeButtonStack: UIStackView!
    @IBOutlet weak var mainStackView: UIStackView!
    
  
    var accessoryButtonTapHandler: (() -> Void)?
    
  
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
 
    @IBAction func accessoryButtonTapped(_ sender: Any) {
        accessoryButtonTapHandler?()
    }
    
  
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = UIColor.clear
        mainStackView.layer.cornerRadius = 10
        mainStackView.clipsToBounds = true
        routeButtonStack.layer.cornerRadius = 20
        routeButtonStack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        routeButtonStack.isLayoutMarginsRelativeArrangement = true
    }
}
