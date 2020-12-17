//
//  GeneralDetailTVCell.swift
//  iOS5-LeDang-Pham
//
//  Created by Kim on 15.12.20.
//

import UIKit

class GeneralDetailTVCell: UITableViewCell {
    
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var infoText: UITextField!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
