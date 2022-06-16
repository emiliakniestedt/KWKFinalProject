//
//  GradeViewController.swift
//  KWKFinalProject
//
//  Created by Scholar on 6/16/22.
//

import UIKit

class GradeViewController: UIViewController {
    @IBAction func currentGradeTextField(_ sender: Any) {
    }
    
    @IBAction func desiredGradeTextField(_ sender: Any) {
    }
    @IBAction func finalExamTextField(_ sender: Any) {
    }
    
    @IBAction func gradeButton(_ sender: Any) {
        let currentGrade = Double(currentGradeTextField.text!)
        let desiredGrade = Double(desiredGradeTextField.text!)
        let finalWorthPercentage = Double(finalExamTextField.text!)
        

        
        
        
                    
        
    
        
        let oneHundredPercent = 100.0
        let percentageOfGrade = Double(oneHundredPercent - finalWorthPercentage!)/100
        let gradeNeededOnFinal = (desiredGrade! - (percentageOfGrade + currentGrade!))/finalWorthPercentage
        
        gradeLabel.text = "You need \(gradeNeededOnFinal * 100)%"
        
    }
    @IBOutlet weak var gradeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
