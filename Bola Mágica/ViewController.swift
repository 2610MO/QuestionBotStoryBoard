//
//  ViewController.swift
//  Bola Mágica
//
//  Created by Luis Servicio on 06/04/18.
//  Copyright © 2018 Luis Morelos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionField: UITextField!
    @IBOutlet weak var askButton: UIButton!
    @IBOutlet weak var responseLabel: UILabel!
    @IBAction func askButtonTaped(_ sender: Any) {
        if questionField.text == "" || questionField.text == " "{
        notText()
        }else{
            respondToQuestion()
            questionField.resignFirstResponder()
        }
    }
    
    let questionAnswerer = MyQuestionAnswerer()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func respondToQuestion() {
        let answer = questionAnswerer.responseTo()
        displayAnswerTextOnScreen(answer)
        questionField.placeholder = "Ask another question..."
        questionField.text = nil
        print("questionAnswered")
    }
    
    func notText(){
        let alert = UIAlertController(title: "Error", message: "Por favor escribe una pregunta para poder responderla", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        responseLabel.text = "Soy la caracola mágica \rHazme una pregunta"
        questionField.resignFirstResponder()
    }

    func displayAnswerTextOnScreen(_ answer: String) {
        responseLabel.text = answer
    }
}
