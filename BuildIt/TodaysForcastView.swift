//
//  TodaysForcastView.swift
//  BuildIt
//
//  Created by Lee Maguire on 07/03/2017.
//  Copyright © 2017 Lee Maguire. All rights reserved.
//

import UIKit

class TodaysForcastView: UIView {

    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    func setLoadingState() {
        minLabel.text = NSLocalizedString("Loading..", comment: "")
        maxLabel.text = NSLocalizedString("Loading..", comment: "")
        currentLabel.text = NSLocalizedString("Loading..", comment: "")
        descriptionLabel.text = NSLocalizedString("Loading..", comment: "")
        imageView.image = UIImage(named: "loading")
    }
    
    func setErrorState() {
        minLabel.text = NSLocalizedString("", comment: "")
        maxLabel.text = NSLocalizedString("", comment: "")
        currentLabel.text = NSLocalizedString("", comment: "")
        descriptionLabel.text = NSLocalizedString("Sorry.. cannot get data 🌧", comment: "")
        imageView.image = UIImage(named: "loading")
    }
    
    func setData(_ forcast: Forcast) {
        //ok so the way we handle localisation here is wrong as the abbreviation may not come before the number, 
        //in our string file we would have the correct formatters for this, something I would create if I had more time
        minLabel.text = "\(NSLocalizedString("Min", comment: "")) \(forcast.main!.minTemp)"
        maxLabel.text = "\(NSLocalizedString("Max", comment: "")) \(forcast.main!.maxTemp)"
        currentLabel.text = "\(NSLocalizedString("Currently: ", comment: "")) \(forcast.main!.currentTemp)"
        descriptionLabel.text = forcast.weather!.description!
        
        switch forcast.weather!.sky! {
        case .cloudy:
            imageView.image = UIImage(named: "cloudy")
        case .clear:
            imageView.image = UIImage(named: "clear")
        case .rain:
            imageView.image = UIImage(named: "rain")
        default:
            break
        }
        
    }
    
}
