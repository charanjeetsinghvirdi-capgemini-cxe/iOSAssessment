//
//  ListRouter.swift
//  iOSAssessment
//
//  Created by Charanjeet Virdi on 02/05/24.
//

import Foundation
import UIKit

class ListRouter: ListPresenterToListRouterProtocol {
    
    //MARK: - Properties
    weak var presenter: ListRouterToListPresenterProtocol?
    
    static func createModule() -> UIViewController {
        guard let view = Constants.getViewController(storyboard: .Main, identifier: .ListVC) as? ListVC else { return UIViewController () }
        
        let presenter: ListViewToListPresenterProtocol & ListInteractorToListPresenterProtocol & ListRouterToListPresenterProtocol = ListPresenter()
        let interactor: ListPresenterToListInteractorProtocol = ListInteractor()
        let router: ListPresenterToListRouterProtocol = ListRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        router.presenter = presenter
        
        return view
    }
    
    func pushToViewController(navigationConroller: UINavigationController, with data: ListModel) {
        guard let view = Constants.getViewController(storyboard: .Main, identifier: .DetailVC) as? DetailVC else { return }
        view.universityDetails = data
        view.delegate = self
        navigationConroller.pushViewController(view, animated: true)
    }
}

//MARK:- ListDetailProtocol methods
extension ListRouter: ListDetailProtocol {
    func refreshListData() {
        presenter?.updateData()
    }
}
