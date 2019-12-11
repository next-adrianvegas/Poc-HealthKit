//
//  InterfaceController.swift
//  HealthKitWorkoutApp WatchKit Extension
//
//  Created by adrian.vegas on 11/12/2019.
//  Copyright © 2019 bbva.next. All rights reserved.
//

import WatchKit
import Foundation
import HealthKit

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var activityType: WKInterfacePicker!
    
    let activities: [(String, HKWorkoutActivityType)] = [("Bicicleta", .cycling),
                                                         ("Correr", .running),
                                                         ("Nadar", .swimming)]
    var selectedActivity = HKWorkoutActivityType.cycling
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        var items = [WKPickerItem]()
        
        for activity in activities {
            let item = WKPickerItem()
            item.title = activity.0
            items.append(item)
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    @IBAction func activityTypeChange(_ value: Int) {
        selectedActivity = activities[value].1
    }
    
    @IBAction func startWorkoutTapped() {
        guard HKHealthStore.isHealthDataAvailable() else {return}
        
        WKInterfaceController.reloadRootControllers(withNames: ["WorkoutInterfaceController"],
                                                    contexts: [selectedActivity])
    }
}
