//
//  Repo.swift
//  githubmobi
//
//  Created by Danagul Otel on 23.07.2018.
//  Copyright © 2018 Danagul Otel. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class Repo: Mappable {
    var id: Int!
    var name: String?
    var type: String?
    var description: String?
    var stars: Int!
    var language: String?
    var forks: Int!
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["full_name"]
        type <- map["type"]
        description <- map["description"]
        stars <- map["stargazers_count"]
        forks <- map["forks_count"]
    }
    
    
    
    static func fetchSalons(with topic: String, callback: @escaping (Repo?, String?) -> Void) {
        var searchableTopic = topic.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        
        Alamofire.request("\(Constants.server)repositories?q=\(searchableTopic)&sort=stars&order=desc")
            // 2
            .responseJSON { response in
                guard response.result.isSuccess,
                    let value = response.result.value as? [String: Any] else {
                        print("Error while fetching tags: \(String(describing: response.result.error))")
                        callback(nil, "Error while fetching")
                        return
                }
                
                guard let result = value["items"] as? [AnyObject] else {
                    print("Error while fetching repos")
                    return
                }
                
                for item in result {
                    if let rp = item as? [String: Any] {
                        let repo = Repo(JSON: rp)
                        callback(repo, nil)
                    }
                }
                
                // 4
                //                completion([Salon], nil)
        }
    }
    
}
