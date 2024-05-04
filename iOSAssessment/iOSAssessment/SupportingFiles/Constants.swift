//
//  Constants.swift
//  iOSAssessment
//
//  Created by Charanjeet Virdi on 03/05/24.
//

import Foundation
import UIKit

struct Constants {
    // MARK: - Base Urls
    static private var BaseUrl = "http://universities.hipolabs.com/"
    
    // MARK: - Web service Urls
    struct APIUrl {
        static var listUrl = Constants.BaseUrl+"search?country=United%20Arab%20Emirates"
    }
    
    //MARK: - Storyboad Identifiers
    enum StoryboadIdentifier: String {
        case Main = "Main"
    }
    
    //MARK: - ViewController Identifiers
    enum ViewControllerIdentifier: String {
        case ListVC = "ListVC"
        case DetailVC = "DetailVC"
    }
    
    //MARK: - TableView Identifiers
    enum TableViewIdentifier: String {
        case ListViewCell = "ListViewCell"
    }
    
    // MARK: -  Popup View
    static let kAlertTitle_MESSAGE = "MESSAGE"
    static let kAlertTitle_ERROR = "ERROR"


    // MARK:-  Alert Action
    static let kAlertAction_YES = "YES"
    static let kAlertAction_CANCEL = "CANCEL"
    static let kAlertAction_NO = "NO"
    static let kAlertAction_OK = "OK"
    
    
    
    // MARK: - UIStoryboard
    static func getViewController(storyboard: StoryboadIdentifier, identifier: ViewControllerIdentifier) -> UIViewController {
        let storyboard = Constants.storyboard(storyboardID: storyboard)
        return storyboard.instantiateViewController(withIdentifier: identifier.rawValue)
    }
    
    private static func storyboard(storyboardID: StoryboadIdentifier) -> UIStoryboard {
        let storyboard = UIStoryboard(name: storyboardID.rawValue, bundle: Bundle.main)
        return storyboard
    }
}
