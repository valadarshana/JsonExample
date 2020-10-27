//
//  ViewController.swift
//  JsonParsing
//
//  Created by Vijay Parmar on 26/10/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        jsonFromFile()
    }



    func jsonFromFile(){
        if let path = Bundle.main.path(forResource: "Persion", ofType: "json") {
            do {
                //Fetch json File in "DATA" Formate
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                //Convert "DATA" to "JSON"
                  let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                //Convert JSon To Dictiony
                  if let jsonResult = jsonResult as? Dictionary<String, AnyObject>,
                     let person = jsonResult["user"] as? [Any] {
                            print(person)
                    print("Name:-",(person[0]as! NSDictionary).value(forKey: "age")as! String)
                  }
              } catch {
                   // handle error
              }
        }
    }
    
    
    
    func getData(){
        
        
      //  let params = ["username":"john", "password":"123456"] as Dictionary<String, String>
      //  let params = [:] as Dictionary<String, String>
       
//        request.httpMethod = "POST"
//        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        var request = URLRequest(url: URL(string: "https://gorest.co.in/public-api/users")!)
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                print(json)
                
                let data = json["data"]as! [Dictionary<String, AnyObject>]
                print(data)
            } catch {
                print("error")
            }
        })
        task.resume()
    }
    
    
    
    
    
}

