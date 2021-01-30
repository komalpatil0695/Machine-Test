//
//  Result.swift
//  Machine Test
//
//  Created by komal_IT on 30/01/21.
//

import Foundation

struct result:Decodable {
    
    let id: Int
    let title:String
    let body : String
    
    init(id:Int,title:String,body:String) {
        self.id = id
        self.title = title
        self.body = body
       
    }
}
