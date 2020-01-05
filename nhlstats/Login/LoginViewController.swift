//
//  ViewController.swift
//  nhlstats
//
//  Created by Daniel Friyia on 2020-01-01.
//  Copyright © 2020 Daniel Friyia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var overlayView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LoginViewModel()
    }
    
    @IBAction func onLogInPressed(_ sender: Any) {
        activityIndicator.startAnimating()
        overlayView.isHidden = false
        viewModel.getAllNhlTeams(
            onSuccess: transitionToTeamsPage,
            onFailure: showErrorMessage)
    }
    
    func transitionToTeamsPage() -> Void {
        self.performSegue(withIdentifier: "goToHome", sender: nil)
    }
    
    func showErrorMessage(error: String) {
        overlayView.isHidden = true
        activityIndicator.stopAnimating()
        let alert = UIAlertController(
            title: "Login Failed",
            message: error,
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(
            title: "Ok",
            style: .default,
            handler: nil))
        
        self.present(
            alert,
            animated: true,
            completion: nil)
    }
}

