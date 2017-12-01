//
//  FontInfoViewController.swift
//  MAPD714-F2017-Fonts
//
//  Created by Akshit Upneja on 2017-11-29.
//  Copyright © 2017 Centennial College. All rights reserved.
//

import UIKit

class FontInfoViewController: UIViewController {
    
    
    var font : UIFont!
    var favorite : Bool = false
    @IBOutlet weak var fontSampleLabel : UILabel!
    @IBOutlet weak var fontSizeSlider : UISlider!
    @IBOutlet weak var fontSizeLabel : UILabel!
    @IBOutlet weak var favoriteSwitch: UISwitch!
  

    @IBAction func slideFontSize (slider : UISlider){
        let newSize = roundf(slider.value)
        fontSampleLabel.font = font.withSize(CGFloat(newSize))
        fontSizeLabel.text = "\(Int(newSize))"
    }
    
    
    @IBAction func toggleFavorite(sender: UISwitch){
        let favoriteList = FavoritesList.sharedFavoritesList
        if sender.isOn {
            favoriteList.addFavorite(fontName: font.fontName)
            
        } else {
            favoriteList.removeFavorites(fontName: font.fontName)
            
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fontSampleLabel.font = font
        fontSampleLabel.text = "AaBbCcDdEeFf0123456789"
        fontSizeSlider.value = Float(font.pointSize)
        fontSizeLabel.text = "\(Int(font.pointSize))"
        favoriteSwitch.isOn = favorite

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
