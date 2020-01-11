//
//  TeamInfoViewController.swift
//  nhlstats
//
//  Created by Daniel Friyia on 2020-01-11.
//  Copyright © 2020 Daniel Friyia. All rights reserved.
//

import UIKit

class TeamInfoViewController: UIViewController {
    
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var winsCountLabel: UILabel!
    @IBOutlet weak var lossesCountLabel: UILabel!
    @IBOutlet weak var goalsPerGameLabel: UILabel!
    @IBOutlet weak var shotsPerGameLabel: UILabel!
    @IBOutlet weak var shootingPercentagePerGameLabel: UILabel!
    
    var viewModel: TeamInfoViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamNameLabel.text = viewModel.team.fullTeamName
        winsCountLabel.text = String(viewModel.team.wins)
        lossesCountLabel.text = String(viewModel.team.losses)
        goalsPerGameLabel.text = String(format: "%.2f", viewModel.team.goalsPerGame)
        shotsPerGameLabel.text = String(format: "%.2f", viewModel.team.shotsPerGame)
        shootingPercentagePerGameLabel.text = String(format: "%.2f", viewModel.team.shootingPctg)
    }
    
    @IBAction func returnToTeamInfoScreen(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
