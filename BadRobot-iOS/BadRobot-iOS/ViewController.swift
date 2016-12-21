//
//  ViewController.swift
//  BadRobot-iOS
//
//  Created by Ramsundar Shandilya on 12/20/16.
//  Copyright © 2016 Ramsundar Shandilya. All rights reserved.
//

import UIKit
import Wit

class ViewController: UIViewController {

    @IBOutlet weak var talkButton: WITMicButton!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Wit.sharedInstance().delegate = self
    }

}

extension ViewController: WitDelegate{
    
    func witDidStartRecording() {
        
    }
    
    func witDidStopRecording() {
        
    }
    
    func witDidGraspIntent(_ outcomes: [Any]!, messageId: String!, customData: Any!, error e: Error!) {
        
        guard let payload = outcomes.first as? [Any],
        let textDict = payload.first as? [String: Any] else {
                return
        }
        
        label.text = textDict["_text"] as? String
    }
}

