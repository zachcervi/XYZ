//
//  ViewController.swift
//  xyzAccelerometer
//
//  Created by Zach Cervi on 10/6/18.
//  Copyright © 2018 Zach Cervi. All rights reserved.
//

import UIKit
import CoreMotion
class ViewController: UIViewController {
    
    //IBOutlets
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    
    var motionManager: CMMotionManager! //create a motion manager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        motionManager = CMMotionManager() //initalize CMMotionManager
       motionManager.startAccelerometerUpdates(to: .main, withHandler: updateLabels)
    }
    //Update Labels
    func updateLabels(data: CMAccelerometerData?, error: Error?){
        guard let accelerometerData = data else {return}
        
        //create number formatter to handle the number of decimals
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        
        //Format the points
        let x = formatter.string(for:accelerometerData.acceleration.x)!
        let y = formatter.string(for: accelerometerData.acceleration.y)!
        let z = formatter.string(for:accelerometerData.acceleration.z)!
        
        //Display the points
        xLabel.text = "X: \(x)"
        yLabel.text = "Y: \(y)"
        zLabel.text = "Z: \(z)"
    }
    
    
}

