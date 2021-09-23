//
//  speedswift
//  Vibro
//
//  Created by Контрабаев Артур on 16.09.2021.
//

import UIKit

protocol SpeedCellDelegate: AnyObject {
    func setNewSpeed (selectedSpeed: Float)
}

class speedCell: UITableViewCell {

    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var speedSlider: UISlider!
    
    weak var delegate: SpeedCellDelegate?
    
    @IBAction func speedSliderMove(_ sender: UISlider) {
        delegate?.setNewSpeed(selectedSpeed: speedSlider.value)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .black
        selectionStyle = .none
        
        speedLabel.text = "SPEED"
        speedLabel.textColor = #colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1)
        speedLabel.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        
        minLabel.text = "min"
        minLabel.textColor = #colorLiteral(red: 0.3921568627, green: 0.3921568627, blue: 0.3921568627, alpha: 1)
        minLabel.font = UIFont (name: "SFProDisplay-Regular", size: 14)
        
        maxLabel.text = "max"
        maxLabel.textColor = #colorLiteral(red: 0.3921568627, green: 0.3921568627, blue: 0.3921568627, alpha: 1)
        maxLabel.font = UIFont (name: "SFProDisplay-Regular", size: 14)
        
        speedSlider.minimumTrackTintColor = K.selectedColor
        speedSlider.maximumTrackTintColor = K.deselectedColor


    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
