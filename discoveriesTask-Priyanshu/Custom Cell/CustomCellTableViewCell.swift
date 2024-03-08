//
//  CustomCellTableViewCell.swift
//  discoveriesTask-Priyanshu
//
//  Created by Zignuts Technolab on 08/03/24.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var accessoryButton: UIButton!
    
    
    @IBOutlet weak var routeButtonStack: UIStackView!
    @IBOutlet weak var mainStackView: UIStackView!
    
    // Connect this action to the Touch Up Inside event of the accessoryButton.
    @IBAction func accessoryButtonTapped(_ sender: Any) {
        print("Accessory button tapped!")
    }
    override func layoutSubviews() {
            super.layoutSubviews()
        mainStackView.layer.cornerRadius = 10
        mainStackView.clipsToBounds = true
        routeButtonStack.layer.cornerRadius = 20
        routeButtonStack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        routeButtonStack.isLayoutMarginsRelativeArrangement = true
        
        
        }

    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = UIColor.clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
