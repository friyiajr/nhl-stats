//
//  TeamRosterViewController.swift
//  nhlstats
//
//  Created by Daniel Friyia on 2020-01-11.
//  Copyright © 2020 Daniel Friyia. All rights reserved.
//

import UIKit

class TeamRosterViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var uiCollectionView: UICollectionView!
    
    let playerViewCellResuseIdentifier = "playerCell"
    
    var viewModel: TeamRosterViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_
        collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return viewModel.roster.count
    }
    
    func collectionView(_
        collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: playerViewCellResuseIdentifier,
            for: indexPath) as! PlayerCollectionViewCell
        
        cell.playerNameLabel.text = viewModel.roster[indexPath.row].name
        cell.playerNumberLabel.text = "#\(viewModel.roster[indexPath.row].number)"
        
        return cell
    }

    @IBAction func goBackToTeamRoster(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
