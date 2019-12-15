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

enum DisplayMode {
    case distance, energy, heartRate
}

class WorkoutInterfaceController: WKInterfaceController, HKWorkoutSessionDelegate {

    @IBOutlet weak var quantityLabel: WKInterfaceLabel!
    @IBOutlet weak var unitLabel: WKInterfaceLabel!
    
    @IBOutlet weak var stopButton: WKInterfaceButton!
    @IBOutlet weak var resumeButton: WKInterfaceButton!
    @IBOutlet weak var endButton: WKInterfaceButton!
    
    var healthStore: HKHealthStore?
    var distanceType = HKQuantityTypeIdentifier.distanceCycling
    var workoutStartDate = Date()
    var activeDataQueries = [HKQuery]()
    var workoutSession: HKWorkoutSession?
    var totalEnergyBurned = HKQuantity(unit: HKUnit.kilocalorie(), doubleValue: 0)
    var totalDistance = HKQuantity(unit: HKUnit.meter(), doubleValue: 0)
    var lastHeartRate = 0.0
    let countPerMinuteUnir = HKUnit(from: "count/min")
    var displayMode = DisplayMode.distance
    var workoutIsActive = true
    

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
                //Start workout
                self.startWorkout(type: activity)
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
    
    func workoutSession(_ workoutSession: HKWorkoutSession, didChangeTo toState:
        HKWorkoutSessionState, from fromState: HKWorkoutSessionState, date: Date) {
        
        switch toState {
        case .running:
            if fromState == . notStarted{
                startQueries()
            }
        default:
            break
        }
    }
    
    func workoutSession(_ workoutSession: HKWorkoutSession, didFailWithError error:Error) {
        
    }
    
    func startWorkout(type: HKWorkoutActivityType) {
        //workout configuration
        let config = HKWorkoutConfiguration()
        config.activityType = type
        config.locationType = .outdoor
        
        //create workout session
        if let session = try? HKWorkoutSession(configuration: config) {
            workoutSession = session
            healthStore?.start(session)
            workoutStartDate = Date()
            session.delegate = self
        }
    }
    
    
    @IBAction func changeDisplayMode() {
    }
    
    @IBAction func stopWorkout() {
    }
    @IBAction func resumeWorkout() {
    }
    @IBAction func endWorkout() {
    }
    
    func updateLabels() {
        
        switch displayMode {
       
        case .distance:
            let meters = totalDistance.doubleValue(for: HKUnit.meter())
            let kilometers = meters / 1000
            let formattedKilometers = String(format: "%2.f", kilometers)
            quantityLabel.setText(formattedKilometers)
            unitLabel.setText("KILOMETERS")
        case .energy:
            let kiloCalories = totalEnergyBurned.doubleValue(for: HKUnit.kilocalorie())
            let formattedKilocalories = String(format: "%.02", kiloCalories)
            quantityLabel.setText(formattedKilocalories)
            unitLabel.setText("CALORIES")
        case .heartRate:
            let heartRate = String(Int(lastHeartRate))
            quantityLabel.setText(heartRate)
            unitLabel.setText("BEATS / MINUTE")
        default:
            <#code#>
        }
    }
    
    func startQuery(quantityTypeIdentifier: HKQuantityTypeIdentifier) {
        //Only want data after workout start date and from our device
        let datePredicate = HKQuery.predicateForSamples(withStart: workoutStartDate, end: nil, options: .strictStartDate)
        let devicePredicate = HKQuery.predicateForObjects(from: [HKDevice.local()])
        let queryPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [datePredicate, devicePredicate])
        
        let updateHandler: (HKAnchoredObjectQuery, [HKSample]?, [HKDeletedObject]?, HKQueryAnchor?,
            Error?) -> Void = {query, samples, deletedObjects, queryAnchor, error in
                guard let samples = samples as? [HKQuantitySample] else {return}
                print(samples)
        }
        
        let query = HKAnchoredObjectQuery(type: HKObjectType.quantityType(forIdentifier: quantityTypeIdentifier)!, predicate: queryPredicate, anchor: nil, limit: HKObjectQueryNoLimit, resultsHandler: updateHandler)
        
        query.updateHandler = updateHandler
        healthStore?.execute(query)
        activeDataQueries.append(query)
    }
    
    func startQueries() {
        startQuery(quantityTypeIdentifier: distanceType)
        startQuery(quantityTypeIdentifier: .activeEnergyBurned)
        startQuery(quantityTypeIdentifier: .heartRate)
        WKInterfaceDevice.current().play(.start)
    }
}
