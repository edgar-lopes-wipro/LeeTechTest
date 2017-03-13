//
//  ViewController.swift
//  BuildIt
//
//  Created by Lee Maguire on 07/03/2017.
//  Copyright © 2017 Lee Maguire. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let api = APIService()
    private let forcastDataSource = ForcastTableViewDataSource()

    @IBOutlet weak var todaysForcastView: TodaysForcastView!
    @IBOutlet weak var forcastTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Settings.defaultCityName
        retrieveForcast(.metric)
        forcastTableView.dataSource = forcastDataSource
    }
    
    func retrieveForcast(_ unit: APIService.unit) {
        todaysForcastView.setLoadingState()
        api.retrieveFiveDayForcast(Settings.defaultCityName, Settings.defaultCountryCode, unit)
        { [unowned self] (weatherResponse, error) in
            if let response = weatherResponse {
                DispatchQueue.main.async {
                    self.setViews(response)
                }
            } else {
                DispatchQueue.main.async {
                    self.todaysForcastView.setErrorState()
                }
            }
        }
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

