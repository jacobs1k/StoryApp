//
//  StoryBrain.swift
//  StoryApp
//
//  Created by Jacob Skiba on 16/01/2023.
//

import Foundation


struct StoryBrain{
    let storyArray = [
        Story(title: "You are a astronaut on a mission to Mars, your spacecraft has encountered a technical issue.", choice1: "Attempt to fix the issue yourself", choice1Dest: 1, choice2: "Contact mission control for assistance", choice2Dest: 2, isEndingSentence: false),
        Story(title: "You spend hours trying to fix the issue, but it seems to be beyond your capabilities.", choice1: "Attempt to jury-rig a solution", choice1Dest: 3, choice2: "Abandon the mission and return to Earth", choice2Dest: 4, isEndingSentence: false),
        Story(title: "Mission control advises you to wait for a rescue team to come to your location", choice1: "Follow their instructions", choice1Dest: 5, choice2: "Attempt to repair the craft and leave the planet", choice2Dest: 6, isEndingSentence: false),
        Story(title: "You manage to temporarily fix the issue and continue the mission.", choice1: "The", choice1Dest: 0, choice2: "End", choice2Dest: 0, isEndingSentence: true),
        Story(title: "You begin the process of returning to Earth, but soon realize that your craft is not in the condition to make the trip safely.", choice1: "The", choice1Dest: 0, choice2: "End", choice2Dest: 0, isEndingSentence: true),
        Story(title: "You follow the instructions from mission control and wait for the rescue team to arrive. After several days, the rescue team reaches your location and safely brings you back to Earth.", choice1: "The", choice1Dest: 0, choice2: "End", choice2Dest: 0, isEndingSentence: true),
        Story(title: "You decide to take matters into your own hands and try to repair the craft. After working tirelessly, you manage to fix the issue and set off back to Earth.", choice1: "The", choice1Dest: 0, choice2: "End", choice2Dest: 0, isEndingSentence: true)
    ]
    
    var storyNumber = 0
    
    mutating func updateStoryNumber (_ whichButton: Int){
        if whichButton == 0 {
            storyNumber = storyArray[storyNumber].choice1Dest
        } else {
            storyNumber = storyArray[storyNumber].choice2Dest
        }
    }
    
    func getText() -> String {
        return storyArray[storyNumber].title
    }
    
    func getChoice1Text() -> String {
        return storyArray[storyNumber].choice1
    }
    
    func getChoice2Text() -> String {
        return storyArray[storyNumber].choice2
    }
    
    func getResetUIText() -> String {
        return "This is the end of the story. Would you like to restart?"
    }
    
    func setResetTitle () -> String{
        return "Reset"
    }
    
    mutating func resetStoryNumber (title:String){
        if title == "Reset"{
            storyNumber = 0
        }
    }
    
    func getEndingCondition() -> Bool {
        if storyArray[storyNumber].isEndingSentence {
            return true
        } else {
            return false
        }
    }
    
    
    
}
