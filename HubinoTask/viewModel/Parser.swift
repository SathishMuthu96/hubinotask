//
//  Parser.swift
//  HubinoTask
//
//  Created by Greens on 10/03/21.
//  Copyright © 2021 Greens. All rights reserved.
//

import UIKit

class Parser: NSObject {
   
        func parsing(completionhandler: @escaping([results])->()){
            let link = "https://us-central1-fwd-api.cloudfunctions.net/getUsersList"
            let url = URL(string: link)
            let task = URLSession.shared.dataTask(with: url!) {
                (data,response,error) in
               // print(data!)
                do {
                    let content = try JSONDecoder().decode(User.self, from: data!)
                   //print(content)
                    completionhandler(content.result)
                   
                }
                catch {
                    print(error)
                }
            }
            task.resume()
    }
    
}
