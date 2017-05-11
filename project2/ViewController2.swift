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
    var engArray = [String]()

    var timer = Timer()
    var audioPlayer : AVAudioPlayer! = nil
    
    var english = ""
    var morse = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        englishText.delegate = self
        morseText.delegate = self
        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            englishText.resignFirstResponder()
            morseText.resignFirstResponder()
            return false
        }
        return true
    }

    
    

    @IBAction func convertEtoM(_ sender: Any) {
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
    
    @IBAction func convertMtoE(_ sender: Any) {
        morseText.resignFirstResponder()
        engArray.removeAll()
        englishText.text = ""
        
        convertMorseToEnglish()

        for word in engArray
        {
            englishText.text.append(word)
        }

    }
    
    @IBAction func playSound(_ sender: Any)
    {
        
        playBeep()
    }
    

    
    func playBeep()
    {
        var symbolArray = [Character]()
        for code in morseArray
        {symbolArray += Array(code.characters)}
        
        for symbol in symbolArray
        {
            if symbol == "."
            {
                timer = Timer(timeInterval: 0.5, target: self, selector: #selector(sound), userInfo: nil, repeats: false)
                print("dot")
            }
            else if symbol == "_"
            {
                timer = Timer(timeInterval: 1, target: self, selector: #selector(sound), userInfo: nil, repeats: false)
                print("dash")
            }
        }

    }
    
    func sound()
    {
//        let path = Bundle.main.path(forResource: "beep", ofType: "mp3")
//        let url = NSURL.fileURL(withPath: path!)
//        do {
//           try audioPlayer = AVAudioPlayer(contentsOf: url)
//            audioPlayer.play()
//        }
//        catch { print("Player not available") }
        let url = NSURL(fileURLWithPath: Bundle.main.path(forResource: "beep", ofType: "wav")!)
        do {
                       try audioPlayer = AVAudioPlayer(contentsOf: url as URL, fileTypeHint: AVFileTypeWAVE)
                        audioPlayer.play()
                    }
                    catch { print("Player not available") }
    
    }
    
    
    func convertEnglishToMorse()
    {
        let tempArray = Array(english.characters)
        for character in tempArray
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
    
    func convertMorseToEnglish()
    {
        let tempArray = morseText.text.components(separatedBy: " ")
        print(tempArray)
        for character in tempArray{
        
        switch character
        {
        case "._":
            engArray.append("a")
        case "_...":
            engArray.append("b")
        case "_._.":
            engArray.append("c")
        case "_..":
            engArray.append("d")
        case ".":
            engArray.append("e")
        case ".._.":
            engArray.append("f")
        case "__.":
            engArray.append("g")
        case "....":
            engArray.append("h")
        case "..":
            engArray.append("i")
        case ".___":
            engArray.append("j")
        case "._..":
            engArray.append("k")
        case "._..":
            engArray.append("l")
        case "__":
            engArray.append("m")
        case "_.":
            engArray.append("n")
        case "___":
            engArray.append("o")
        case ".__.":
            engArray.append("p")
        case "__._":
            engArray.append("q")
        case "._.":
            engArray.append("r")
        case "...":
            engArray.append("s")
        case "_":
            engArray.append("t")
        case ".._":
            engArray.append("u")
        case "..._":
            engArray.append("v")
        case ".__":
            engArray.append("w")
        case "_.._":
            engArray.append("x")
        case "_.__":
            engArray.append("y")
        case "__..":
            engArray.append("z")
        case "/":
            engArray.append(" ")
        case "":
            engArray.append("")
        default:
            engArray.append("?")

            }
        }
    
    }
}
