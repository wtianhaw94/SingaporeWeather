//
//  RealTimeWeatherViewController.swift
//  SingaporeWeather
//
//  Created by Tian Haw on 3/28/18.
//  Copyright © 2018 tianhaw. All rights reserved.
//

import UIKit
import RealmSwift

class WeatherViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var uiRealm = try! Realm()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var label_date: UILabel!
    @IBOutlet weak var label_text: UILabel!
    @IBOutlet weak var label_temperature: UILabel!
    
    var forecastArray = List<Forecast>()
    var progressBar = UIView()
    var titleNav: String?
    var offLineMode : Bool = false
    var weather = Weather()
    var forecast = Forecast()
    
    //Rest API url
    let urlString = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22singapore%2C%20sg%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"
    
    //Realm Manager
    var realmManager = RealmManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Check offlineMode
        print("OfflineMode : ",offLineMode)
        
        //Add ProgressBar for loading
        progressBar = progressBarDisplay("Loading", true)
        
        //TableView setup row height
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //Get Weather Data
        if offLineMode {
            getDataFromRealm()
        } else {
            getWeatherData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = titleNav
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Call Rest API
    func getWeatherData(){
        //Implementing URLSession
        self.view.addSubview(progressBar)
        //Implementing URLSession
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            print("[Json] : ", json)
            DispatchQueue.main.async {
                try! self.uiRealm.write {
                    self.uiRealm.deleteAll()
                    self.uiRealm.create(Weather.self, value: json, update: true)
                    
                }
                self.uiRealm.refresh()
                self.progressBar.removeFromSuperview()
                self.getDataFromRealm()
                self.tableView.reloadData()
                self.viewWillAppear(true)
            }
        }.resume()
        //End implementing URLSession
        
    }
    
    func getDataFromRealm(){
        
        let weather = realmManager.getWeatherData()
//        print("Weather wearther, : ",weather.query?.results?.channel?.item?.forecast)
        forecastArray = (weather.query?.results?.channel?.item?.forecast)!
        self.label_date.text = (weather.query?.results?.channel?.item?.condition?.date)!
        self.label_text.text = (weather.query?.results?.channel?.item?.condition?.text)!
        self.label_temperature.text = (weather.query?.results?.channel?.item?.condition?.temp)!
        
        self.titleNav = "\( (weather.query?.results?.channel?.location?.city)!) , \((weather.query?.results?.channel?.location?.country)!)"
    }
    
}

extension WeatherViewController {
    
    
    //Table View Setup ====[Started] ====
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeatherTableViewCell
        cell.label_date.text = "\(forecastArray[indexPath.row].date) \(forecastArray[indexPath.row].day)"
        cell.label_temperature.text = "\(forecastArray[indexPath.row].low) - \(forecastArray[indexPath.row].high)"
        cell.label_text.text = forecastArray[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        forecast = forecastArray[indexPath.row]
        self.performSegue(withIdentifier: "detailSegue", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let destinationVC = segue.destination as! DetailWeatherViewController
            print(forecast)
            destinationVC.forecast = forecast
        }
    }
    //Table View Setup ====[End] ====
}
