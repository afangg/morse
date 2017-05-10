//
//  ViewController2.swift
//  project2
//
//  Created by student5 on 5/8/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

class ViewController2: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var englishText: UITextView!
    @IBOutlet weak var morseText: UITextView!
    var morseArray = [String]()
    var timer = Timer()
    var audioPlayer = AVAudioPlayer()
    
    var english = ""
    var morse = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        englishText.delegate = self

        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            englishText.resignFirstResponder()
            return false
        }
        return true
    }

    
    
    @IBAction func convert(_ sender: Any)
    {
        englishText.resignFirstResponder()

        english = englishText.text.lowercased()
        morseArray.removeAll()
        morseText.text = ""
        
        convertEnglishToMorse()
        
        for word in morseArray
        {
            morseText.text.append(" " + word + " ")
        }
    }
    
    @IBAction func playSound(_ sender: Any)
    {
        
        makeVibration()
    }
    

    
    func makeVibration()
    {
        var symbolArray = [Character]()
        for code in morseArray
        {symbolArray += Array(code.characters)}
        
        for symbol in symbolArray
        {
            if symbol == "."
            {
                timer = Timer(timeInterval: 0.01, target: self, selector: #selector(sound), userInfo: nil, repeats: false)
                print("dot")
            }
            else if symbol == "_"
            {
                timer = Timer(timeInterval: 0.05, target: self, selector: #selector(sound), userInfo: nil, repeats: false)
                print("dash")
            }
        }

    }
    
    func sound()
    {
        let path = Bundle.main.path(forResource: "beep", ofType: "mp3")
        let url = NSURL.fileURL(withPath: path!)
        do {
            audioPlayer =  try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
        }
        catch { print("Player not available") }    }
    
    
    func convertEnglishToMorse()
    {
        let englishArray = Array(english.characters)
        for character in englishArray
        {
            switch character
            {
            case "a":
                morseArray.append("._")
            case "b":
                morseArray.append("_...")
            case "c":
                morseArray.append("_._.")
            case "d":
                morseArray.append("_..")
            case "e":
                morseArray.append(".")
            case "f":
                morseArray.append(".._.")
            case "g":
                morseArray.append("__.")
            case "h":
                morseArray.append("....")
            case "i":
                morseArray.append("..")
            case "j":
                morseArray.append(".___")
            case "k":
                morseArray.append("._..")
            case "l":
                morseArray.append("._..")
            case "m":
                morseArray.append("__")
            case "n":
                morseArray.append("_.")
            case "o":
                morseArray.append("___")
            case "p":
                morseArray.append(".__.")
            case "q":
                morseArray.append("__._")
            case "r":
                morseArray.append("._.")
            case "s":
                morseArray.append("...")
            case "t":
                morseArray.append("_")
            case "u":
                morseArray.append(".._")
            case "v":
                morseArray.append("..._")
            case "w":
                morseArray.append(".__")
            case "x":
                morseArray.append("_.._")
            case "y":
                morseArray.append("_.__")
            case "z":
                morseArray.append("__..")
            case " ":
                morseArray.append("/")
            default:
                morseArray.append("?")
            }
            
        }
        
    }
    
}
