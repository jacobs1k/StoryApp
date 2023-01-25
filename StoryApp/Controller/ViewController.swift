//
//  ViewController.swift
//  StoryApp
//
//  Created by Jacob Skiba on 16/01/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLabelText: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    @IBAction func choiceMade(_ sender: UIButton) {
        let buttonTag = sender.tag
        let buttonTitle = sender.currentTitle
        let isEndingQuestion = storyBrain.getEndingCondition()
        
        storyBrain.updateStoryNumber(buttonTag)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if isEndingQuestion{
                self.resetUI()
            } else {
                self.updateUI()
            }
        }
        storyBrain.resetStoryNumber(title: buttonTitle!)
    }
    
    
    func resetUI(){
        storyLabelText.text = storyBrain.getResetUIText()
        choice1Button.setTitle(storyBrain.setResetTitle(), for: .normal)
        choice2Button.isHidden = true
        
    }
    func updateUI(){
        choice2Button.isHidden = false
        storyLabelText.text = storyBrain.getText()
        choice1Button.setTitle(storyBrain.getChoice1Text(), for: .normal)
        choice2Button.setTitle(storyBrain.getChoice2Text(), for: .normal)
    }
}

