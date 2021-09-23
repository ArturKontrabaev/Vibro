//
//  intensityswift
//  Vibro
//
//  Created by Контрабаев Артур on 16.09.2021.
//

import UIKit
protocol IntensityCellDelegate: AnyObject {
    func setNewIntensity(selectedIntensity: K.Intensity)
}

class intensityCell: UITableViewCell {

    @IBOutlet weak var intensityLabel: UILabel!
    @IBOutlet weak var softButton: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!
    
    weak var delegate: IntensityCellDelegate?
    
    @IBAction func intensityButtonPressed(_ sender: UIButton) {
        if sender == softButton {
            delegate?.setNewIntensity(selectedIntensity: .soft)
            softButton.backgroundColor = K.selectedColor
            mediumButton.backgroundColor = K.deselectedColor
            hardButton.backgroundColor = K.deselectedColor
        } else if sender == mediumButton {
            delegate?.setNewIntensity(selectedIntensity: .medium)
            softButton.backgroundColor = K.deselectedColor
            mediumButton.backgroundColor = K.selectedColor
            hardButton.backgroundColor = K.deselectedColor
        } else {
            delegate?.setNewIntensity(selectedIntensity: .hard)
            softButton.backgroundColor = K.deselectedColor
            mediumButton.backgroundColor = K.deselectedColor
            hardButton.backgroundColor = K.selectedColor
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .black
        selectionStyle = .none
        
        intensityLabel.text = "INTENSITY"
        intensityLabel.textColor = #colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1)
        intensityLabel.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        
        softButton.setTitle("Soft", for: .normal)
        softButton.layer.masksToBounds = true
        softButton.layer.cornerRadius = 20
        softButton.backgroundColor = K.selectedColor
        softButton.titleLabel?.font = UIFont (name: "SFProDisplay-Regular", size: 14)
        softButton.setTitleColor(.white, for: .normal)
       
        mediumButton.setTitle("Medium", for: .normal)
        mediumButton.layer.masksToBounds = true
        mediumButton.layer.cornerRadius = 20
        mediumButton.backgroundColor = K.deselectedColor
        mediumButton.titleLabel?.font = UIFont (name: "SFProDisplay-Regular", size: 14)
        mediumButton.setTitleColor(.white, for: .normal)
        
        hardButton.setTitle("Hard", for: .normal)
        hardButton.layer.masksToBounds = true
        hardButton.layer.cornerRadius = 20
        hardButton.backgroundColor = K.deselectedColor
        hardButton.titleLabel?.font = UIFont (name: "SFProDisplay-Regular", size: 14)
        hardButton.setTitleColor(.white, for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
