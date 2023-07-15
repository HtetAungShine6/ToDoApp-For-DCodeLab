//
//  Extensions.swift
//  DCode Todo
//
//  Created by Akito Daiki on 14/7/2566 BE.
//

import Foundation
extension Encodable{
    func asDictionary() -> [String: Any]{
        guard let data = try? JSONEncoder().encode(self)
        else{
            return [:]
        }
        
        //once we get data from data, convert into json
        do{
            //json=dictionary
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        }catch{
            return [:]
        }
    }
}
