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
        
        englishText.contentOffset = .zero
        morseText.contentOffset = .zero
        
        
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
        
        for index in 0..<morseArray.count
        {
            if index != morseArray.count-1 && index != 0
                && morseArray[index] == "/" && morseArray[index+1] == "/"{}
                
            else if (index == morseArray.count-1) && morseArray[index] == "/" {}
                
            else
            {
                morseText.text.append(" " + morseArray[index] + " ")
            }
        }
 
    }
    
    @IBAction func convertMtoE(_ sender: Any) {
        morseText.resignFirstResponder()
        engArray.removeAll()
        englishText.text = ""
        morseArray = morseText.text.components(separatedBy: "/")
        
        convertMorseToEnglish()

        for index in 0..<engArray.count
        {
            if index != engArray.count-1 && index != 0
                && engArray[index] == " " && engArray[index+1] == " "{}
                
            else if index == engArray.count-1 && engArray[index] == " " {}
                
            else
            {
                englishText.text.append(engArray[index])
            }
            
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
                sound(name: "beep", type: "mp3")
                print("dot")
            }
            else if symbol == "-"
            {
                sound(name: "longBeep", type: "mp3")
                print("dash")
            }
            Thread.sleep(forTimeInterval: 0.1)
        }

    }
    
    func sound(name: String, type: String)
    {
        
        let url = NSURL(fileURLWithPath: Bundle.main.path(forResource: name, ofType: type)!)
        do {
                       try audioPlayer = AVAudioPlayer(contentsOf: url as URL, fileTypeHint: AVFileTypeMPEGLayer3)
                        audioPlayer.play()
                    }
        catch { print("Player not available") }
    
    }
    
    
    func convertEnglishToMorse()
    {
        var tempArray = Array(english.characters)
        var length = tempArray.count-1
        
        for character in tempArray
        {
            switch character
            {
            case "a":
                morseArray.append(".-")
            case "b":
                morseArray.append("-...")
            case "c":
                morseArray.append("-.-.")
            case "d":
                morseArray.append("-..")
            case "e":
                morseArray.append(".")
            case "f":
                morseArray.append("..-.")
            case "g":
                morseArray.append("--.")
            case "h":
                morseArray.append("....")
            case "i":
                morseArray.append("..")
            case "j":
                morseArray.append(".---")
            case "k":
                morseArray.append(".-..")
            case "l":
                morseArray.append(".-..")
            case "m":
                morseArray.append("--")
            case "n":
                morseArray.append("-.")
            case "o":
                morseArray.append("---")
            case "p":
                morseArray.append(".--.")
            case "q":
                morseArray.append("--.-")
            case "r":
                morseArray.append(".-.")
            case "s":
                morseArray.append("...")
            case "t":
                morseArray.append("-")
            case "u":
                morseArray.append("..-")
            case "v":
                morseArray.append("...-")
            case "w":
                morseArray.append(".--")
            case "x":
                morseArray.append("-..-")
            case "y":
                morseArray.append("-.--")
            case "z":
                morseArray.append("--..")
            case "1":
                morseArray.append(".---")
            case "2":
                morseArray.append("..---")
            case "3":
                morseArray.append("...--")
            case "4":
                morseArray.append("....-")
            case "5":
                morseArray.append(".....")
            case "6":
                morseArray.append("-....")
            case "7":
                morseArray.append("--...")
            case "8":
                morseArray.append("---..")
            case "9":
                morseArray.append("----.")
            case "0":
                morseArray.append("-----")
            case " ":
                morseArray.append("/")
            case ".": break
            default:
                morseArray.append("?")
            }
            
        }
        
    }
    
    func convertMorseToEnglish()
    {
        let tempArray = morseText.text.components(separatedBy: " ")
        for character in tempArray{
        
        switch character
        {
        case ".-":
            engArray.append("a")
        case "-...":
            engArray.append("b")
        case "-.-.":
            engArray.append("c")
        case "-..":
            engArray.append("d")
        case ".":
            engArray.append("e")
        case "..-.":
            engArray.append("f")
        case "--.":
            engArray.append("g")
        case "....":
            engArray.append("h")
        case "..":
            engArray.append("i")
        case ".---":
            engArray.append("j")
        case ".-..":
            engArray.append("k")
        case ".-..":
            engArray.append("l")
        case "--":
            engArray.append("m")
        case "-.":
            engArray.append("n")
        case "---":
            engArray.append("o")
        case ".--.":
            engArray.append("p")
        case "--.-":
            engArray.append("q")
        case ".-.":
            engArray.append("r")
        case "...":
            engArray.append("s")
        case "-":
            engArray.append("t")
        case "..-":
            engArray.append("u")
        case "...-":
            engArray.append("v")
        case ".--":
            engArray.append("w")
        case "-..-":
            engArray.append("x")
        case "-.--":
            engArray.append("y")
        case "--..":
            engArray.append("z")
        case ".---":
            morseArray.append("1")
        case "..---":
            morseArray.append("2")
        case "...--":
            morseArray.append("3")
        case "....-":
            morseArray.append("4")
        case ".....":
            morseArray.append("5")
        case "-....":
            morseArray.append("6")
        case "--...":
            morseArray.append("7")
        case "---..":
            morseArray.append("8")
        case "----.":
            morseArray.append("9")
        case "-----":
            morseArray.append("0")
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
