//
//  ListViewCell.swift
//  iOSAssessment
//
//  Created by Charanjeet Virdi on 03/05/24.
//

import UIKit

class ListViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var cellBGView: UIView!
    @IBOutlet weak var lblUniversityName: UILabel!
    @IBOutlet weak var lblUniversityStateName: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCellUI()
    }
    
    private func setupCellUI() {
        cellBGView.layer.cornerRadius = 8.0
        cellBGView.layer.borderWidth = 0.5
        cellBGView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func populateDataIntoCell(data: ListModel?) {
        self.lblUniversityName.text = data?.name ?? ""
        self.lblUniversityStateName.text = data?.country ?? ""
    }
}
