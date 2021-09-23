//
//  type1SettingsCell.swift
//  Vibro
//
//  Created by Контрабаев Артур on 20.09.2021.
//

import UIKit

class type1SettingsCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = #colorLiteral(red: 0.1323487163, green: 0.1323487163, blue: 0.1323487163, alpha: 1)
        selectionStyle = .none
        
        label.textColor = .white
        label.font = UIFont(name: "SFProDisplay-Regular", size: 17)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
