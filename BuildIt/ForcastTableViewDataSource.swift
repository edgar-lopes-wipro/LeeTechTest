//
//  ForcastTableViewDataSource.swift
//  BuildIt
//
//  Created by Lee Maguire on 07/03/2017.
//  Copyright © 2017 Lee Maguire. All rights reserved.
//

import UIKit

class ForcastTableViewDataSource: NSObject {
    var forcasts: [Forcast] = []
    
    func refreshData(_ forcasts: [Forcast]) {
        self.forcasts = forcasts
    }
}

extension ForcastTableViewDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forcasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ForcastCell") as! ForcastTableViewCell
        cell.setData(forcasts[indexPath.row])
        return cell
    }
}
