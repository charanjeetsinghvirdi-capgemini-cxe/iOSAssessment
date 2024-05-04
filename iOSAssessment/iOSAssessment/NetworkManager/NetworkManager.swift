//
//  NetworkManager.swift
//  iOSAssessment
//
//  Created by Charanjeet Virdi on 02/05/24.
//

import Foundation
import Alamofire

//MARK: - Custom errors
enum ErrorType: Error {
    case ServerError
    case NoDataFound
    case DecodingError
    
    var localizedDescription: String {
        switch  self {
        case .ServerError:
            return "Server error"
        case .DecodingError:
            return "Data parsing error"
        case .NoDataFound:
            return "No Data Found"
        }
    }
}

//MARK: - NetworkManagerProtocol methods
protocol NetworkManagerProtocol {
    func getRequest<T: Decodable>(url: URL, type: T.Type, completionHandler: @escaping (_ data: T?, _ error: ErrorType?) -> Void)
}

//MARK: - NetworkManager class for making API calls and class conforms to NetworkManagerProtocol.
class NetworkManager: NetworkManagerProtocol {
    func getRequest<T>(url: URL, type: T.Type, completionHandler: @escaping (T?, ErrorType?) -> Void) where T : Decodable {
        AF.request(url).response { response in
            if response.response?.statusCode == 200 {
                guard let data = response.data else {
                    return completionHandler(nil, .NoDataFound)
                }
                do {
                    let decoder = JSONDecoder()
                    let jsonData = try decoder.decode(type.self, from: data)
                    completionHandler(jsonData, nil)
                } catch {
                    completionHandler(nil, .DecodingError)
                }
            } else {
                completionHandler(nil, .ServerError)
            }
        }
    }
}
