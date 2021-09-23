//
//  emptySettingsCellTableViewCell.swift
//  Vibro
//
//  Created by Контрабаев Артур on 20.09.2021.
//

import UIKit

class emptySettingsCellTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .black
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
