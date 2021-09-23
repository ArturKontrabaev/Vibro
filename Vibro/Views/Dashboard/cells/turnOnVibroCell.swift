//
//  turnOnVibroswift
//  Vibro
//
//  Created by Контрабаев Артур on 16.09.2021.
//

import UIKit

class turnOnVibroCell: UITableViewCell {
  
    @IBOutlet weak var selectedModeLabel: UILabel!
    @IBOutlet weak var pressButtonLabel: UILabel!
    @IBOutlet weak var pressButtonLabel2: UILabel!
    @IBOutlet weak var turnOnButton: UIButton!
    @IBOutlet weak var vibroImage: UIImageView!
    @IBOutlet weak var vibroImage2: UIImageView!
    @IBOutlet weak var doesntVibrateButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        backgroundColor = .black
        selectionStyle = .none
        
        selectedModeLabel.text = "Waves"
        selectedModeLabel.textColor = .white
        selectedModeLabel.font = UIFont(name: "SFProDisplay-Regular", size: 34)
        
        pressButtonLabel.text = "Press the button"
        pressButtonLabel.textColor = #colorLiteral(red: 0.7333333333, green: 0.337254902, blue: 0.3764705882, alpha: 1)
        pressButtonLabel.font = UIFont(name: "SFProDisplay-Regular", size: 18)
        
        pressButtonLabel2.text = "to start massage"
        pressButtonLabel2.textColor = #colorLiteral(red: 0.7333333333, green: 0.337254902, blue: 0.3764705882, alpha: 1)
        pressButtonLabel2.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        
        turnOnButton.setImage(#imageLiteral(resourceName: "turnOnButton"), for: .normal)
        turnOnButton.setTitle("", for: .normal)
        
        vibroImage.image = #imageLiteral(resourceName: "noVibroBack")
        vibroImage2.image = #imageLiteral(resourceName: "noVibroBack")
        
        doesntVibrateButton.setTitle("Doesn't vibrate?", for: .normal)
        doesntVibrateButton.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        doesntVibrateButton.setTitleColor(#colorLiteral(red: 0.3921568627, green: 0.3921568627, blue: 0.3921568627, alpha: 1), for: .normal)
    }
    @IBAction func turnOnButtonPressed(_ sender: UIButton) {
//        if #available(iOS 10.0, *) {
//              UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
//           }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
