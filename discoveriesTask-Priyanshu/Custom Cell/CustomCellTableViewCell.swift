//
//  CustomCellTableViewCell.swift
//  discoveriesTask-Priyanshu
//
//  Created by Zignuts Technolab on 08/03/24.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var accessoryButton: UIButton!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var routeButtonStack: UIStackView!
    @IBOutlet weak var mainStackView: UIStackView!
    
    var accessoryButtonTapHandler: (() -> Void)?
        
        @IBAction func accessoryButtonTapped(_ sender: Any) {
            accessoryButtonTapHandler?()
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
