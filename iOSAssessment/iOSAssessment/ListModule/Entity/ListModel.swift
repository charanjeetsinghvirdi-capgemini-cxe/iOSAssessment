//
//  ListModel.swift
//  iOSAssessment
//
//  Created by Charanjeet Virdi on 02/05/24.
//

import Foundation
import Realm
import RealmSwift

//MARK: - ListModel class conforms to Object and Decodable
class ListModel: Object, Decodable {
    //MARK: - Properties
    @Persisted var id : ObjectId = ObjectId.generate()
    @Persisted var domains = RealmSwift.List<String>()
    @Persisted var stateProvince : String = ""
    @Persisted var name : String = ""
    @Persisted var webPages = RealmSwift.List<String>()
    @Persisted var country : String = ""
    @Persisted var alphaTwoCode : String = ""

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case domains = "domains"
        case stateProvince = "state-province"
        case name = "name"
        case webPages = "web_pages"
        case country = "country"
        case alphaTwoCode = "alpha_two_code"
    }
    
    required override init() {
        super.init()
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        domains = try values.decodeIfPresent(List<String>.self, forKey: .domains) ?? List<String>()
        stateProvince = try values.decodeIfPresent(String.self, forKey: .stateProvince) ?? ""
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        webPages = try values.decodeIfPresent(List<String>.self, forKey: .webPages) ?? List<String>()
        country = try values.decodeIfPresent(String.self, forKey: .country) ?? ""
        alphaTwoCode = try values.decodeIfPresent(String.self, forKey: .alphaTwoCode) ?? ""
        super.init()
    }
}
