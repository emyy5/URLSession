//
//  ViewController.swift
//  UrlSessionDemo
//
//  Created by Eman Khaled on 30/05/2023.
//

import UIKit

class ViewController: UIViewController {
    
    var networkIndicator: UIActivityIndicatorView?
    
    @IBOutlet weak var myLabel: UILabel!

    @IBOutlet weak var salaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        networkIndicator = UIActivityIndicatorView(style: .large)
        networkIndicator!.color = UIColor.red
        networkIndicator!.center = view.center
        networkIndicator!.startAnimating()
        
        view.addSubview(networkIndicator!)
    }
    
    @IBAction func getDatabtn(_ sender: Any) {
        
        let url = URL(string: "https://dummy.restapiexample.com/api/v1/employees")
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request){ data, response , error in
            //            do{
            //                let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Dictionary<String, Any>
            //7atly el data or value bta3et el key elly esoh data elly fe el json dah w rag3haly as array of dictionary w el dic beytkwn mn string w Any bardoh
            // let dataArrr = json["data"] as! Array<Dictionary<String, Any>>
            //tab enta me7tag eh mn el dataArray 1- hatly awel element w awel ele 3bara 3n dic
            //  let dic = dataArrr[0]
            //mn el dic 3ayez atal3 el data deh
            //  let empName = dic["employee_name"] as! String
            // el finish elly ana 3malto ba'ah howa 1- raga3t el data fe soret dic 2- mn el dic gebt array of dic  3- tala3t el dic elly gowah w tala3t el data mnoh  w hatetha fe employee_name
            //print (empName)
            //3delt el label gwah el main thread
            // DispatchQueue.main.async {
            
            //  self.myLabel.text = empName
            //self.networkIndicator?.stopAnimating()
            // }
            
            //  }
            // catch{
            // print("\(error.localizedDescription)")
            // }
            
            // }
            //task.resume()
            //  }
            do {
                if let data = data {
                    if let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String, Any> {
                        // Now you can use the 'json' dictionary
                        //7atly el data or value bta3et el key elly esoh data elly fe el json dah w rag3haly as array of dictionary w el dic beytkwn mn string w Any bardoh
                        let dataArrr = json["data"] as! Array<Dictionary<String, Any>>
                        //tab enta me7tag eh mn el dataArray 1- hatly awel element w awel ele 3bara 3n dic
                        let dic = dataArrr[0]
                        //mn el dic 3ayez atal3 el data deh
                        let empName = dic["employee_name"] as! String
                       let salary = dic["employee_salary"] as! Int
                        // el finish elly ana 3malto ba'ah howa 1- raga3t el data fe soret dic 2- mn el dic gebt array of dic  3- tala3t el dic elly gowah w tala3t el data mnoh  w hatetha fe employee_name
                        print (empName)
                        print(salary)
                        //3delt el label gwah el main thread
                        DispatchQueue.main.async {
                            self.myLabel.text = empName
                            self.salaLabel.text = String(salary)
                            self.networkIndicator?.stopAnimating()
                            
                        }
                    } else {
                        print("Failed to parse JSON")
                    }
                } else {
                    print("Data is nil")
                }
            } catch {
                print("Error parsing JSON: \(error)")
            }
        }
        
        task.resume()
    }
}

