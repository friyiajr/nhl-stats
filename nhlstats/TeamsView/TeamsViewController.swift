//
//  TeamsViewController.swift
//  nhlstats
//
//  Created by Daniel Friyia on 2020-01-04.
//  Copyright © 2020 Daniel Friyia. All rights reserved.
//

import UIKit

class TeamsViewController: UIViewController {
    
    @IBOutlet var rootView: UIView!
    
    let kRowSize: CGFloat = 75.0
    let numOfTeams: Int = 10
    
    var scrollView: UIScrollView!
    var currentDistanceFromTop: CGFloat = 90.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createScrollView()
        pageTitle()
        createAllTeamsView()
    }
    
    func createScrollView() -> Void {
        
        let screenWidth = rootView.frame.size.width
        let screenHeight = rootView.frame.size.height
        
        self.scrollView = UIScrollView()
        self.scrollView.backgroundColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)
        self.scrollView.contentSize = CGSize(width: screenWidth, height: 1000.0)
        
        self.view.addSubview(self.scrollView)

        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = NSLayoutConstraint(
            item: self.scrollView!,
            attribute: NSLayoutConstraint.Attribute.centerX,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: view,
            attribute: NSLayoutConstraint.Attribute.centerX,
            multiplier: 1,
            constant: 0)
        
        let verticalConstraint = NSLayoutConstraint(
            item: self.scrollView!,
            attribute: NSLayoutConstraint.Attribute.centerY,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: view,
            attribute: NSLayoutConstraint.Attribute.centerY,
            multiplier: 1,
            constant: 0)
        
        let widthConstraint = NSLayoutConstraint(
            item: self.scrollView!,
            attribute: NSLayoutConstraint.Attribute.width,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: screenWidth)
        
        let heightConstraint = NSLayoutConstraint(
            item: self.scrollView!,
            attribute: NSLayoutConstraint.Attribute.height,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: screenHeight)
        
        view.addConstraints([
            horizontalConstraint,
            verticalConstraint,
            widthConstraint,
            heightConstraint
        ])
    }
    
    func pageTitle() -> Void {
        let title: UILabel = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Tap on a team to view players and stats"
        title.textColor = .white
        self.scrollView.addSubview(title)
        
        let horizontalConstraint = NSLayoutConstraint(
            item: title,
            attribute: NSLayoutConstraint.Attribute.centerX,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: self.scrollView,
            attribute: NSLayoutConstraint.Attribute.centerX,
            multiplier: 1,
            constant: 0)
        
        let verticalConstraint = NSLayoutConstraint(
            item: title,
            attribute: NSLayoutConstraint.Attribute.top,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: self.scrollView,
            attribute: NSLayoutConstraint.Attribute.top,
            multiplier: 1,
            constant: 50)
        
        self.scrollView.addConstraints([
            horizontalConstraint,
            verticalConstraint,
        ])
    }
    
    func createRowHeader(title: String) -> Void {
        let screenWidth = rootView.frame.size.width
        
        // Header Background
        let header: UIView = UIView()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.backgroundColor = UIColor(red: 0.77, green: 0.77, blue: 0.77, alpha: 1.00)
        header.layer.borderWidth = 1
        header.layer.borderColor = UIColor.black.cgColor
        self.scrollView.addSubview(header)

        let verticalConstraint = NSLayoutConstraint(
            item: header,
            attribute: NSLayoutConstraint.Attribute.top,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: self.scrollView,
            attribute: NSLayoutConstraint.Attribute.top,
            multiplier: 1,
            constant: currentDistanceFromTop)

        let widthConstraint = NSLayoutConstraint(
            item: header,
            attribute: NSLayoutConstraint.Attribute.width,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: screenWidth)
        
        let heightConstraint = NSLayoutConstraint(
            item: header,
            attribute: NSLayoutConstraint.Attribute.height,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: 25)

        self.scrollView.addConstraints([
            verticalConstraint,
            widthConstraint,
            heightConstraint
        ])
        
        // Header Title
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title.uppercased()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor(red: 0.44, green: 0.44, blue: 0.44, alpha: 1.00)
        header.addSubview(label)
        
        let verticalConstraintForTitle = NSLayoutConstraint(
            item: label,
            attribute: NSLayoutConstraint.Attribute.centerY,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: header,
            attribute: NSLayoutConstraint.Attribute.centerY,
            multiplier: 1,
            constant: 0)
        
        let horizontalConstraint = NSLayoutConstraint(
            item: label,
            attribute: NSLayoutConstraint.Attribute.left,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: header,
            attribute: NSLayoutConstraint.Attribute.left,
            multiplier: 1,
            constant: 20)
        
        header.addConstraints([
            verticalConstraintForTitle,
            horizontalConstraint
        ])
        
        currentDistanceFromTop += 21
    }
    
    func addTitleToRow(newRow: UIView) -> Void {
        let label: UILabel = UILabel()
        label.text = "Edmonton Oilers"
        label.font = UIFont(name: label.font.fontName, size: 20)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        newRow.addSubview(label)
        
        let horizontalConstraintForLabel = NSLayoutConstraint(
            item: label,
            attribute: NSLayoutConstraint.Attribute.centerX,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: newRow,
            attribute: NSLayoutConstraint.Attribute.centerX,
            multiplier: 1,
            constant: -40)
        
        let verticalConstraintForLabel = NSLayoutConstraint(
            item: label,
            attribute: NSLayoutConstraint.Attribute.centerY,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: newRow,
            attribute: NSLayoutConstraint.Attribute.centerY,
            multiplier: 1,
            constant: 0)
        
        newRow.addConstraints([
            horizontalConstraintForLabel,
            verticalConstraintForLabel,
        ])
    }
    
    func addImageToRow(newRow: UIView) -> Void {
        // Add contents to the row
        let image = UIImage(named: "oilers")
        let imageView = UIImageView(image: image!)
        newRow.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraintForImage = NSLayoutConstraint(
            item: imageView,
            attribute: NSLayoutConstraint.Attribute.left,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: newRow,
            attribute: NSLayoutConstraint.Attribute.left,
            multiplier: 1,
            constant: 20)

        let verticalConstraintForImage = NSLayoutConstraint(
            item: imageView,
            attribute: NSLayoutConstraint.Attribute.centerY,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: newRow,
            attribute: NSLayoutConstraint.Attribute.centerY,
            multiplier: 1,
            constant: 0)
        
        let heightConstraintForImage = NSLayoutConstraint(
            item: imageView,
            attribute: NSLayoutConstraint.Attribute.height,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: 45)
        
        let widthConstraintForImage = NSLayoutConstraint(
            item: imageView,
            attribute: NSLayoutConstraint.Attribute.width,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: 45)

        newRow.addConstraints([
            horizontalConstraintForImage,
            verticalConstraintForImage,
            widthConstraintForImage,
            heightConstraintForImage,
        ])
    }
    
    func generateRowBody() -> UIView {
        let screenWidth = rootView.frame.size.width
        
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 1.0)
        bottomBorder.backgroundColor = UIColor.black.cgColor
        
        // Create the row and add it to the screen
        let newRow: UIView = UIView()
        newRow.translatesAutoresizingMaskIntoConstraints = false
        newRow.backgroundColor = .white
        newRow.layer.addSublayer(bottomBorder)
        newRow.layer.borderColor = UIColor.black.cgColor
        self.scrollView.addSubview(newRow)

        let verticalConstraint = NSLayoutConstraint(
            item: newRow,
            attribute: NSLayoutConstraint.Attribute.top,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: self.scrollView,
            attribute: NSLayoutConstraint.Attribute.top,
            multiplier: 1,
            constant: currentDistanceFromTop)

        let widthConstraint = NSLayoutConstraint(
            item: newRow,
            attribute: NSLayoutConstraint.Attribute.width,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: screenWidth)
        
        let heightConstraint = NSLayoutConstraint(
            item: newRow,
            attribute: NSLayoutConstraint.Attribute.height,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: kRowSize)

        self.scrollView.addConstraints([
            verticalConstraint,
            widthConstraint,
            heightConstraint
        ])
        
        return newRow;
    }
    
    func addStarToRow(newRow: UIView) -> Void {
        // Add contents to the row
        let image = UIImage(named: "outline-star")
        let imageView = UIImageView(image: image!)
        newRow.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraintForImage = NSLayoutConstraint(
            item: imageView,
            attribute: NSLayoutConstraint.Attribute.right,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: newRow,
            attribute: NSLayoutConstraint.Attribute.right,
            multiplier: 1,
            constant: -10)

        let verticalConstraintForImage = NSLayoutConstraint(
            item: imageView,
            attribute: NSLayoutConstraint.Attribute.centerY,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: newRow,
            attribute: NSLayoutConstraint.Attribute.centerY,
            multiplier: 1,
            constant: 0)
        
        let heightConstraintForImage = NSLayoutConstraint(
            item: imageView,
            attribute: NSLayoutConstraint.Attribute.height,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: 35)
        
        let widthConstraintForImage = NSLayoutConstraint(
            item: imageView,
            attribute: NSLayoutConstraint.Attribute.width,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: 35)

        newRow.addConstraints([
            horizontalConstraintForImage,
            verticalConstraintForImage,
            widthConstraintForImage,
            heightConstraintForImage,
        ])
    }
    
    func generateRowItems() -> Void {
        let newRow: UIView = generateRowBody()
        addImageToRow(newRow: newRow)
        addTitleToRow(newRow: newRow)
        addStarToRow(newRow: newRow)
        currentDistanceFromTop += kRowSize
    }
    
    func createAllTeamsView() -> Void {
        createRowHeader(title: "Teams")
        generateRowItems()
        generateRowItems()
        generateRowItems()
        generateRowItems()
        generateRowItems()
        generateRowItems()
        generateRowItems()
        generateRowItems()
        generateRowItems()
        generateRowItems()
        generateRowItems()
    }
}
