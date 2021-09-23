//
//  modesswift
//  Vibro
//
//  Created by Контрабаев Артур on 16.09.2021.
//

import UIKit
import CoreHaptics

protocol ModesCellDelegate: AnyObject {
    func setNewMode (selectedMode: String)
}

class modesCell: UITableViewCell, UICollectionViewDelegate {

    @IBOutlet weak var modesLabel: UILabel!
    @IBOutlet weak var modesCollectionView: UICollectionView!
    
    var selectedCell: IndexPath?
    weak var delegate: ModesCellDelegate?
    
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .black
        selectionStyle = .none
        
        modesCollectionView.register(cellClass: modeCell.self)
        modesCollectionView.dataSource = self
        modesCollectionView.delegate = self
       
        let layout = UICollectionViewFlowLayout()
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.itemSize = makeCellSize()
        modesCollectionView.collectionViewLayout = layout
        modesCollectionView.backgroundColor = .black
            
       
        modesLabel.text = "MODES"
        modesLabel.backgroundColor = .black
        modesLabel.textColor = #colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1)
        modesLabel.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        
        func makeCellSize() -> CGSize {
            var itemWidth: CGFloat = 76
            
            itemWidth = (K.SCREEN_SIZE.width - 23 - 23) / 4
            return CGSize(width: itemWidth, height: itemWidth + 30)
        }

    }
}


//MARK: - UICollectionViewDataSource
extension modesCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return K.modes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = modesCollectionView.dequeueReusableCell(withReuseIdentifier: K.modeCell, for: indexPath) as! modeCell
        
        cell.load(name: K.modes[indexPath.row].name, image: K.modes[indexPath.row].image)
        
        if indexPath.row == 0{
            selectedCell = indexPath
            cell.selected()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! modeCell
        let prevCell = collectionView.cellForItem(at: selectedCell!) as! modeCell
        
        delegate?.setNewMode(selectedMode: cell.modeNameLabel.text!)
        
        cell.selected()
        prevCell.deselected()
        selectedCell = indexPath
    }
}
