//
//  DetailVC.swift
//  iOSAssessment
//
//  Created by Charanjeet Virdi on 03/05/24.
//

import UIKit

//MARK: -  ListDetailProtocol methods
protocol ListDetailProtocol: AnyObject {
    func refreshListData()
}

class DetailVC: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var lblUniversityName: UILabel!
    @IBOutlet weak var lblUniversityState: UILabel!
    @IBOutlet weak var lblCountryName: UILabel!
    @IBOutlet weak var lblCountryCode: UILabel!
    @IBOutlet weak var lblWebPage: UILabel!
    
    //MARK: - Properties
    var universityDetails: ListModel?
    weak var delegate: ListDetailProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setDataOnUIElements()
    }
    
    @IBAction func reloadListData(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        delegate?.refreshListData()
    }
}

//MARK: - Helper Methods
extension DetailVC {
    private func setupUI() {
        self.bgView.layer.cornerRadius = 8.0
        self.bgView.layer.borderWidth = 0.5
        self.bgView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private func setDataOnUIElements() {
        lblUniversityName.text = universityDetails?.name ?? ""
        lblUniversityState.text = universityDetails?.stateProvince ?? " - "
        lblCountryName.text = universityDetails?.country ?? ""
        lblCountryCode.text = universityDetails?.alphaTwoCode ?? ""
        lblWebPage.text = universityDetails?.webPages.first
    }
}
