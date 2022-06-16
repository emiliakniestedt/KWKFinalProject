//
//  EventEditViewController.swift
//  KWKFinalProject
//
//  Created by Vicky Zhu on 6/16/22.
//

import UIKit

class EventEditViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var nameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.date = selectedDate
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveAction(_ sender: Any) {
        let newEvent = Event()
        newEvent.id = eventsList.count
        newEvent.name = nameTF.text
        newEvent.date = datePicker.date
        
        eventsList.append(newEvent)
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
