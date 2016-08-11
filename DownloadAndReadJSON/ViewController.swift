//
//  ViewController.swift
//  DownloadAndReadJSON
//
//  Created by wealthyjalloh on 09/08/2016.
//  Copyright © 2016 CWJ. All rights reserved.
// code complete


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        // downloading the file
        let requestURL = NSURL(string: "http://www.learnswiftonline.com/Samples/subway.json")!
        
        let urlRequest: NSMutableURLRequest =  NSMutableURLRequest(URL: requestURL)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(urlRequest) {
            (data, response, error ) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("file downloaded successfully")
                
                // reading json
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                    
                    if let stations = json["stations"] as? [[String: AnyObject]] {
                        
                    for station in stations {
                    
                        if let name = station["stationName"] as? String {
                            if let year = station["buildYear"] as? String {
                                print(name, year)
                            }
                        }
                    }
                }
                
                } catch {
                    print("error with json \(error)")
                }
            
        }
            
        }
        task.resume()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


// thank you http://www.learnswiftonline.com/


