//
//  ViewController.swift
//  BuildIt
//
//  Created by Lee Maguire on 07/03/2017.
//  Copyright © 2017 Lee Maguire. All rights reserved.
//

import UIKit

protocol WeatherReportViewProtocol {
    func showCurrentReport(weatherResponse: WeatherResponse)
    func failedToGetReport(error: BTError?)
}

class ViewController: UIViewController, WeatherReportViewProtocol {
    private let api = APIService()
    private let forcastDataSource = ForcastTableViewDataSource()

    @IBOutlet weak var todaysForcastView: TodaysForcastView!
    @IBOutlet weak var forcastTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Settings.defaultCityName
        api.view = self
        retrieveForcast(.metric)
        forcastTableView.dataSource = forcastDataSource
    }
    
    func retrieveForcast(_ unit: APIService.unit) {
        todaysForcastView.setLoadingState()
        api.retrieveFiveDayForcast(Settings.defaultCityName, Settings.defaultCountryCode, unit)
    }
    
    func setViews(_ response: WeatherResponse) {
        todaysForcastView.setData(response.currentForcast()!)
        forcastDataSource.refreshData(response.forcasts)
        forcastTableView.reloadData()
    }

    @IBAction func changedUnit(_ sender: Any) {
        if let sender = sender as? UISegmentedControl {
            switch sender.selectedSegmentIndex {
            case 0: retrieveForcast(.metric)
                break
            case 1: retrieveForcast(.imperial)
                break
            default:
                break
            }
        }
    }

}

extension WeatherReportViewProtocol where Self: ViewController {
    
    func showCurrentReport(weatherResponse: WeatherResponse) {
        DispatchQueue.main.async {
            self.setViews(weatherResponse)
        }
    }
    func failedToGetReport(error: BTError?) {
        DispatchQueue.main.async {
            self.todaysForcastView.setErrorState()
        }
    }
}
