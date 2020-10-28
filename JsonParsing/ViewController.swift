//
//  ViewController.swift
//  JsonParsing
//
//  Created by Vijay Parmar on 26/10/20.
//

import UIKit
struct detail
{
    static var objDetail = detail()
    var name:String!
    var age:Int!
    var emp:String!
}

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var TableView: UITableView!
    
    //var obj=[detail]()
    var obj=[Any]()
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.delegate=self
        TableView.dataSource=self
       // jsonFromFile()
        jsonFromURL()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return obj.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"TableViewCellDetail" , for: indexPath)as! TableViewCellDetail
        cell.lblAge.text=(((obj[indexPath.row])as! NSDictionary).value(forKey: "email")as! String)
        cell.lblName.text=(((obj[indexPath.row])as! NSDictionary).value(forKey: "name")as! String)
        cell.lblEmp.text=(((obj[indexPath.row])as! NSDictionary).value(forKey: "gender")as! String)
        return cell
    }
    

    func jsonFromFile(){
        if let path = Bundle.main.path(forResource: "Persion", ofType: "json") {
            do {
                //Fetch json File in "DATA" Formate
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                //Convert "DATA" to "JSON"
                  let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                //Convert JSon To Dictiony
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>{
                    obj = jsonResult["person"] as? [Any] ?? []
                    TableView.reloadData()
                    
                           // print(person)
                    //print("Name:-",(person[0]as! NSDictionary).value(forKey: "age")as! String)
                  }
              } catch {
                   // handle error
              }
        }
    }
    
    
    
    func jsonFromURL(){
        
        
        //Define URL REQUEST
        var request = URLRequest(url: URL(string: "https://gorest.co.in/public-api/users")!)

        //DEFINE SESSION
        let session = URLSession.shared
        
        //DEFINE SESSION TASK
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            do {
                //CONVERT DATA TO JSON
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                print(json)
                //CONVERT JSON TO DICTIONARY
                self.obj = json["data"]as! [Any]
                DispatchQueue.main.async {
                    self.TableView.reloadData()
                }
                print(data)
                
            } catch {
                print("error")
            }
        })
        task.resume()
    }
    
    
    
    
    
}

