//
//  ListVC.swift
//  iOSAssessment
//
//  Created by Charanjeet Virdi on 02/05/24.
//

import UIKit

class ListVC: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    var presenter: ListViewToListPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter?.updateListView()
    }
}

//MARK: - Helper Methods
extension ListVC {
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: Constants.TableViewIdentifier.ListViewCell.rawValue, bundle: nil), forCellReuseIdentifier: Constants.TableViewIdentifier.ListViewCell.rawValue)
    }
}

//MARK: - ListPresenterToListViewProtocol methods
extension ListVC: ListPresenterToListViewProtocol {
    func showUniversityList() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showErrorMessage(with error: ErrorType?) {
        let alert = UIAlertController(title: Constants.kAlertTitle_ERROR, message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: Constants.kAlertAction_OK, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

//MARK: - UITableViewDataSource Methods
extension ListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getUniversityListCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewIdentifier.ListViewCell.rawValue, for: indexPath) as? ListViewCell else { return UITableViewCell() }
        let cellData = presenter?.getUniversityData(at: indexPath.row)
        cell.populateDataIntoCell(data: cellData)
        return cell
    }
}

//MARK: - UITableViewDelegate Methods
extension ListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let nav = navigationController , let data = presenter?.getUniversityData(at: indexPath.row) {
            presenter?.showViewController(navigationController: nav, with: data)
        }
    }
}
