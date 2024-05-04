//
//  ListPresenter.swift
//  iOSAssessment
//
//  Created by Charanjeet Virdi on 02/05/24.
//

import Foundation
import UIKit

class ListPresenter: ListViewToListPresenterProtocol {

    //MARK: - Properties
    weak var view: ListPresenterToListViewProtocol?
    var interactor: ListPresenterToListInteractorProtocol?
    var router: ListPresenterToListRouterProtocol?
    
    func updateListView() {
        interactor?.fetchUniversityList()
    }
    
    func showViewController(navigationController: UINavigationController, with data: ListModel) {
        router?.pushToViewController(navigationConroller: navigationController, with: data)
    }
    
    func getUniversityListCount() -> Int? {
        return interactor?.universityList?.count
    }
    
    func getUniversityData(at index: Int) -> ListModel? {
        return interactor?.universityList?[index]
    }
}

//MARK: - ListInteractorToListPresenterProtocol methods
extension ListPresenter: ListInteractorToListPresenterProtocol {
    func universityListFetchedFailed(with errorType: ErrorType?) {
        view?.showErrorMessage(with: errorType)
    }
    
    func universityListFetched() {
        view?.showUniversityList()
    }
}

//MARK: - ListRouterToListPresenterProtocol methods
extension ListPresenter: ListRouterToListPresenterProtocol {
    func updateData() {
        interactor?.fetchUniversityList()
    }
}
