//
//  Api Manager.swift
//  Machine Test
//
//  Created by komal_IT on 30/01/21.
//

import Foundation


class ApiManager{
    static let sharedInstance   =   ApiManager()
    private init(){
         
     }
    func getdata(onCompletion:@escaping([result])-> Void){
        
        var resultArr = [result]()
          let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
            
            let task = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                do{
                    if error == nil{
                        
                        resultArr = try JSONDecoder().decode([result].self, from: data!)
            
                       onCompletion(resultArr)
                    }
                }catch{
                   print(error)
                    onCompletion(resultArr)
                }
                
            })
       task.resume()
     }
}
