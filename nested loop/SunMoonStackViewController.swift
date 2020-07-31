//
//  SunMoonStackViewController.swift
//  nested loop
//
//  Created by tantsunsin on 2020/7/30.
//  Copyright © 2020 tantsunsin. All rights reserved.
//

import UIKit

class SunMoonStackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadview()
        // Do any additional setup after loading the view.
    }
    
    var shape = 0
    var lines = 0
    var SunMoonArray = Array(repeating: Array(repeating: "🌚", count: 9), count: 9)
    
    @IBOutlet weak var StackTextView: UITextView!
    @IBOutlet weak var LineLabel: UILabel!
    @IBOutlet weak var SunMoonTextView: UITextView!
    @IBOutlet weak var SliderOutlet: UISlider!
    
    @IBAction func shapesegment(_ sender: UISegmentedControl) {
        shape = sender.selectedSegmentIndex
        
        //切換segment的時候先出現全部月亮的底圖
        SunMoonArray = Array(repeating: Array(repeating: "🌚", count: 9), count: 9)
        loadview()
        
        //切換segment的時候重置，歸零
        SliderOutlet.value = 0
        LineLabel.text = "0"
    }
    
    //拉動slider的時候調整lines
    @IBAction func linesofsun(_ sender: UISlider) {
        lines = Int(sender.value)
        
        //菱形跟金字塔只能用奇數
        if shape >= 2 && lines % 2 != 0 || shape < 2 || lines == 0{
            LineLabel.text = String(lines)
        } else {
            LineLabel.text = String(lines - 1)
            lines = lines - 1
        }
        changeview()
    }
    
    //主要程式（先做成Array）：
    func changeview(){
        switch shape {
        
        //正方形
        case 0:
            SunMoonArray = Array(repeating: Array(repeating: "🌚", count: 9), count: 9)
            for i in 0...lines{
                for s in 0...lines{
                    if i != 0, s != 0{
                        SunMoonArray[i-1][s-1] = "🌞"
                    }
                }
            }
            loadview()
            
        //三角形
        case 1:
            SunMoonArray = Array(repeating: Array(repeating: "🌚", count: 9), count: 9)
            for i in 0...lines{
                for s in 0...i{
                    if i != 0, s != 0{
                        SunMoonArray[i-1][s-1] = "🌞"
                    }
                }
            }
            loadview()
        
        //菱形
        case 2:
            SunMoonArray = Array(repeating: Array(repeating: "🌚", count: 9), count: 9)
            
            var r : Int
            
            for i in 0...lines{
                if i <= 1{
                    r = 0
                }else if Float(i) < Float(lines) / 2{
                    r = i - 1
                }else{
                    r = lines - i
                }
                
                for s in (5-r)...(5+r){
                    if i != 0, s != 0{
                        SunMoonArray[i-1][s-1] = "🌞"
                    }
                }
            }
            loadview()

        //金字塔
        case 3:
            SunMoonArray = Array(repeating: Array(repeating: "🌚", count: 9), count: 9)

            var r : Int

            for i in 0...lines{
                if i <= 1{
                    r = 0
                }else if i % 2 != 0{
                    r = (i - 1) / 2
                }else{
                    r = (i / 2) - 1
                }
                
                for s in (5-r)...(5+r){
                    if i != 0, s != 0{
                        SunMoonArray[i-1][s-1] = "🌞"
                    }
                }
            }
            loadview()
        
        default:
            loadview()
        }

    }

        
    //從Array轉成太陽月亮的畫面載入
    func loadview(){
        
        if SunMoonTextView.text != "" {
            SunMoonTextView.text = ""
        }
        
        for i in 0...8{
            for s in 0...8{
                SunMoonTextView.text.append("\(SunMoonArray[i][s])")
            }
            SunMoonTextView.text.append("\n")
        }
 
    }
                

}
