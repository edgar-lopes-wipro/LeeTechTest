//
//  ForcastTableViewCell.swift
//  BuildIt
//
//  Created by Lee Maguire on 07/03/2017.
//  Copyright © 2017 Lee Maguire. All rights reserved.
//

import UIKit

class ForcastTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var descImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func setData(_ forcast: Forcast) {
        minLabel.text = "\(NSLocalizedString("Min", comment: "")) \(forcast.main!.minTemp)"
        maxLabel.text = "\(NSLocalizedString("Max", comment: "")) \(forcast.main!.maxTemp)"
        descriptionLabel.text = forcast.weather!.description!
        
        dateLabel.text = forcast.date!.dayAndTimeString
        
        switch forcast.weather!.sky! {
        case .cloudy:
            descImageView.image = UIImage(named: "cloudy")
        case .clear:
            descImageView.image = UIImage(named: "clear")
        case .rain:
            descImageView.image = UIImage(named: "rain")
        default:
            break
        }
    }

}
