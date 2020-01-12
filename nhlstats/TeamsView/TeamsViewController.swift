//
//  TeamsViewController.swift
//  nhlstats
//
//  Created by Daniel Friyia on 2020-01-04.
//  Copyright © 2020 Daniel Friyia. All rights reserved.
//

import UIKit

class TeamsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var rootView: UIView!
    @IBOutlet var uiTableView: UITableView!

    let cellReuseIdentifier = "teamsCell"

    var viewModel: TeamsViewModel = TeamsViewModel()

    override func viewDidLoad() {
        uiTableView.delegate = self
        uiTableView.dataSource = self
        uiTableView.rowHeight = 75
    }

    // After adding a new Pomodoro we need to refresh the list
    override func viewDidAppear(_: Bool) {
        viewModel.reloadTeams()
        uiTableView.reloadData()
    }

    // number of rows in table view
    func tableView(_:
        UITableView,
                   numberOfRowsInSection _: Int) -> Int {
        return viewModel.teams.count
    }

    // create a cell for each table view row
    func tableView(_:
        UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TeamTableViewCell = uiTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! TeamTableViewCell
        cell.teamNameLabel.text = viewModel.teams[indexPath.row].fullTeamName
        return cell
    }

    // method to run when table view cell is tapped
    func tableView(_:
        UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        viewModel.selectedIndex = indexPath.row
        self.performSegue(withIdentifier: "goToTeamInfo", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TeamInfoViewController {
            let selectedTeam: Team = viewModel.teams[viewModel.selectedIndex]
            vc.viewModel = TeamInfoViewModel(team: selectedTeam)
        }
    }

}
