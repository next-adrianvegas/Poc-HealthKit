//
//  WorkoutInterfaceController.swift
//  HealthKitWorkoutApp WatchKit Extension
//
//  Created by adrian.vegas on 11/12/2019.
//  Copyright © 2019 bbva.next. All rights reserved.
//

import WatchKit
import Foundation
import HealthKit

class WorkoutInterfaceController: WKInterfaceController {

    @IBOutlet weak var quantityLabel: WKInterfaceLabel!
    @IBOutlet weak var unitLabel: WKInterfaceLabel!
    
    @IBOutlet weak var stopButton: WKInterfaceButton!
    @IBOutlet weak var resumeButton: WKInterfaceButton!
    @IBOutlet weak var endButton: WKInterfaceButton!
    
    var healthStore: HKHealthStore?
    var distanceType = HKQuantityTypeIdentifier.distanceCycling
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        guard let activity = context as? HKWorkoutActivityType else {return}
        
        switch activity {
        case .cycling:
            distanceType = .distanceCycling
        case .running:
            distanceType = .distanceWalkingRunning
        case .swimming:
            distanceType = .distanceSwimming
        default:
            distanceType = .distanceCycling
        }
        
        //Values to write
        let writeTypes: Set<HKSampleType> = [.workoutType(),
                                             HKSampleType.quantityType(forIdentifier: .heartRate)!,
                                             HKSampleType.quantityType(forIdentifier: .activeEnergyBurned)!,
                                             HKSampleType.quantityType(forIdentifier: distanceType)!]
        
        //Values to read
        let readTypes: Set<HKObjectType> = [.activitySummaryType(), .workoutType(),
                                             HKObjectType.quantityType(forIdentifier: .heartRate)!,
                                             HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!,
                                             HKObjectType.quantityType(forIdentifier: distanceType)!]
        //Health Store
        healthStore = HKHealthStore()
        
        //use it to request auth for our types
        healthStore?.requestAuthorization(toShare: writeTypes, read: readTypes) { success, error in
            if success {
                //Start
            }
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
    @IBAction func changeDisplayMode() {
    }
    
    @IBAction func stopWorkout() {
    }
    @IBAction func resumeWorkout() {
    }
    @IBAction func endWorkout() {
    }
}
