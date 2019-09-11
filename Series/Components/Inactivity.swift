////
////  Inactivity.swift
////  Series
////
////  Created by julio vargas bautista on 9/11/19.
////  Copyright © 2019 SalvadorKano. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//var timer: Timer?
////Now we’ll create a restartTimer function that we’ll call every time we want to restart the clock:
//
//func resetTimer() {
//    timer?.invalidate()
//    timer = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(hideControls), userInfo: nil, repeats: false)
//}
////This timer calls a hideControls function after 10 seconds. Let’s create the hideControls function:
//
//@objc func hideControls() {
//    // Hide controls here
//}
////Now call this resetTimer() in viewDidAppear:
//
//override func viewDidAppear(_ animated: Bool) {
//    super.viewDidAppear(animated)
//    setupVideoPlayer()
//    resetTimer()
//}
//let tapGesture = UITapGestureRecognizer(target: self, action: #selector(toggleControls))
//view.addGestureRecognizer(tapGesture)
////Now we need to create a toggleControls function:
//
//@objc func toggleControls() {
//    // toggle controls here
//    resetTimer()
//}
