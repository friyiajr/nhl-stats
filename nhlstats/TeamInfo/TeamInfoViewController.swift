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
        populateTeamStatistics()
    }
    
    func populateTeamStatistics() -> Void {
        teamNameLabel.text = viewModel.fullName
        winsCountLabel.text = viewModel.winsCountLabel
        lossesCountLabel.text = viewModel.lossesCountLabel
        goalsPerGameLabel.text = viewModel.goalsPerGameLabel
        shotsPerGameLabel.text = viewModel.shotsPerGameLabel
        shootingPercentagePerGameLabel.text = viewModel.shootingPercentagePerGameLabel
    }
    
    @IBAction func returnToTeamInfoScreen(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onViewRosterClicked(_ sender: Any) {
        viewModel.retrieveRoster(
            onSuccess: onTeamRosterRetrieved,
            onFailure: handleTeamRetrievalError)
    }
    
    func onTeamRosterRetrieved() -> Void {
        performSegue(withIdentifier: "goToTeamRoster", sender: nil)
    }
    
    func handleTeamRetrievalError(error: String) -> Void {
        print(error)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TeamRosterViewController {
            vc.viewModel = viewModel.rosterViewModel
        }
    }
    
}
