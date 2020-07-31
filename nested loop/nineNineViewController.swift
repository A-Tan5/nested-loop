//
//  nineNineViewController.swift
//  nested loop
//
//  Created by tantsunsin on 2020/7/30.
//  Copyright © 2020 tantsunsin. All rights reserved.
//

import UIKit

class nineNineViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaulttext()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBOutlet weak var NineNineTextView: UITextView!
    @IBOutlet weak var NineNineTextViewTwo: UITextView!
    @IBOutlet weak var NineNineTextViewThree: UITextView!
    var nineninetext = String()
    
    // 原本等號後面沒東西的程式：
    func defaulttext(){
        var number : Int = 1
        var secondnumber : Int = 1
        var defaulttext = String()
        var defaulttexttwo = String()
        var defaulttextthree = String()
        
        for number in 1...3{
            for secondnumber in 1...9{
                defaulttext.append("\(number) * \(secondnumber) = \n")
            }
            defaulttext.append("\n")
        }
        
        for number in 4...6{
            for secondnumber in 1...9{
                defaulttexttwo.append("\(number) * \(secondnumber) = \n")
            }
            defaulttexttwo.append("\n")
        }
        
        for number in 7...9{
            for secondnumber in 1...9{
                defaulttextthree.append("\(number) * \(secondnumber) = \n")
            }
            defaulttextthree.append("\n")
        }
        
        NineNineTextView.text = defaulttext
        NineNineTextViewTwo.text = defaulttexttwo
        NineNineTextViewThree.text = defaulttextthree
    }
    
    
    //按下Create後出現等號後面的數字：
    @IBAction func createninenine(_ sender: Any) {
        var x : Int
        var y : Int
        var finaltext = String()
        var finaltexttwo = String()
        var finaltextthree = String()
        
        for x in 1...3{
            for y in 1...9{
                finaltext.append ("\(x) * \(y) = \(x * y)\n")
            }
            finaltext.append("\n")
        }
        
        for x in 4...6{
            for y in 1...9{
                finaltexttwo.append ("\(x) * \(y) = \(x * y)\n")
            }
            finaltexttwo.append("\n")
        }
        
        for x in 7...9{
            for y in 1...9{
                finaltextthree.append ("\(x) * \(y) = \(x * y)\n")
            }
            finaltextthree.append("\n")
        }
        
        NineNineTextView.text = finaltext
        NineNineTextViewTwo.text = finaltexttwo
        NineNineTextViewThree.text = finaltextthree
    }
    
    
    //按下reset回復到原本狀態
    @IBAction func backtodefault(_ sender: Any) {
        defaulttext()
    }
    

}
