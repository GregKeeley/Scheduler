//
//  CreateEventViewController.swift
//  Scheduler
//
//  Created by Gregory Keeley on 11/20/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController {
    
    @IBOutlet weak var createEventTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createEventTextField.delegate = self
        event = Event(date: Date(), name: event?.name ?? "Event or whatever")

    }
    @IBAction func datePickerChanged(sender: UIDatePicker) {
        event?.date = sender.date
    }
    
}
//MARK: Extensions
extension CreateEventViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        event?.name = createEventTextField.text ?? "No event name"
        return true
    }
}
