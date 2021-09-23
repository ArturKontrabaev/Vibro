//
//  modeCell.swift
//  Vibro
//
//  Created by Контрабаев Артур on 16.09.2021.
//

import UIKit

class modeCell: UICollectionViewCell {

    @IBOutlet weak var modeImage: UIImageView!
    @IBOutlet weak var modeNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        backgroundColor = .black
    
        modeNameLabel.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        modeNameLabel.textColor = #colorLiteral(red: 0.7333333333, green: 0.337254902, blue: 0.3764705882, alpha: 1)
        modeNameLabel.backgroundColor = .black
        modeImage.backgroundColor = .black
    }
    
    func load(name:String, image:UIImage){
        modeNameLabel.text = name
        modeImage.image = image
    }
    
    func selected() {
        modeImage.layer.borderWidth = 2
        modeImage.layer.cornerRadius = modeImage.layer.frame.width/2
        modeImage.layer.borderColor = K.selectedColor.cgColor
    }
    
    func deselected(){
        modeImage.layer.borderWidth = 0
    }
}
