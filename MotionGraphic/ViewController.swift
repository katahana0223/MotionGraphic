//
//  ViewController.swift
//  MotionGraphic
//
//  Created by hahahahahanananana on 2017/10/31.
//  Copyright © 2017年 片岡. All rights reserved.
//

import UIKit
import C4

class ViewController: CanvasController {
    
    var blueshapenumber: Int = 1
    var squareRectanglenumber: Int = 2
    var regularPolygonnumber: Int = 3
    var number: Int!
    
    override func setup() {
        super.setup()
        canvas.backgroundColor = Color(red: 54, green: 79, blue:107
            , alpha: 1.0)
        ShapeLayer.disableActions = true
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //        squareRectangle.rotation = -0.5 * Double.pi
    }
    
    func animateShape() {
        let blueShape = Circle(center: canvas.center, radius: 55.0)
        //始まる方向を指定
        blueShape.rotation = -0.5 * Double.pi
        blueShape.lineWidth = 20.0
        blueShape.strokeColor = Color(red: 252, green: 81, blue:133, alpha: 1.0)
        blueShape.fillColor = clear
        blueShape.strokeStart = 0.0
        blueShape.strokeEnd = 0.001
        self.canvas.add(blueShape)
        let move = ViewAnimation(duration: 1.0){
            blueShape.strokeEnd = 1
        }
        move.animate()
        blueshapenumber = 0
        wait(1.1){
            let disapper = ViewAnimation(duration:1.0){
                blueShape.strokeEnd = -1
            }
            disapper.animate()
            self.blueshapenumber = 1
            
        }
    }
    
    func animateWithBackground(){
        
        let pink = Circle(frame: Rect(0, 0, 50, 50))
        let pinkColor = Color(red: 67, green: 221, blue:230, alpha: 1.0)
        pink.fillColor = pinkColor
        pink.strokeColor = pinkColor
        pink.center = canvas.center
        canvas.add(pink)
        
        // MARK: - Animations
        let scale = Transform.makeScale(100, 100)
        let fadeOutColor = pinkColor
        
        let pinkAnim = ViewAnimation(duration: 1.0) {
            pink.transform = scale
            pink.fillColor = fadeOutColor
        }
        let sequence = ViewAnimationSequence(animations: [
            pinkAnim
            ])
        sequence.duration = 0.5
        wait(0.5) {
            sequence.animate()
            
            wait(0.45){
                self.canvas.backgroundColor = Color(red: 67, green: 221, blue:230, alpha: 1.0)
                
            }
        }
    }
    
    func animateRectangle() {
        
        let squareCenter = Rectangle(frame: Rect(0, 0, 40, 0))
        //場所指定
        squareCenter.center = Point(canvas.center.x, canvas.center.y + 40)
        //角
        squareCenter.corner = Size(0,0)
        squareCenter.strokeColor = Color(red: 238, green: 238, blue:238
            , alpha: 1.0)
        squareCenter.fillColor = Color(red: 238, green: 238, blue:238
            , alpha: 1.0)
        self.canvas.add(squareCenter)
        
        
        let squareLeft = Rectangle(frame: Rect(0, 0, 40, 0))
        let interval = (canvas.bounds.width-120)/4
        squareLeft.center = Point(canvas.center.x - interval - 20, canvas.center.y + 40)
        squareLeft.corner = Size(0,0)
        squareLeft.strokeColor = Color(red: 238, green: 238, blue:238
            , alpha: 1.0)
        squareLeft.fillColor = Color(red: 238, green: 238, blue:238
            , alpha: 1.0)
        self.canvas.add(squareLeft)
        
        let sqareright = Rectangle(frame: Rect(0, 0, 40, 0))
        sqareright.center = Point(canvas.center.x + interval + 20, canvas.center.y + 40)
        sqareright.corner = Size(0,0)
        sqareright.strokeColor = Color(red: 238, green: 238, blue:238
            , alpha: 1.0)
        sqareright.fillColor = Color(red: 238, green: 238, blue:238
            , alpha: 1.0)
        self.canvas.add(sqareright)
        
        let move = ViewAnimation(duration: 1.0){
            squareCenter.bounds = Rect(0, 0, 40, 250)
            squareCenter.strokeColor = Color(red: 238, green: 238, blue:238
                , alpha: 1.0)
            squareCenter.fillColor = Color(red: 238, green: 238, blue:238
                , alpha: 1.0)
            squareCenter.frame = Rect(squareCenter.center,Size(squareCenter.width,225))
    
            
            squareLeft.bounds = Rect(0, 0, 40, 250)
            squareLeft.strokeColor = Color(red: 238, green: 238, blue:238
                , alpha: 1.0)
            squareLeft.fillColor = Color(red: 238, green: 238, blue:238
                , alpha: 1.0)
            squareLeft.frame = Rect(Point(squareLeft.center.x-20,squareLeft.center.y+250),Size(squareCenter.width,225))
           
            
            sqareright.bounds = Rect(0, 0, 40, 250)
            sqareright.strokeColor = Color(red: 238, green: 238, blue:238
                , alpha: 1.0)
            sqareright.fillColor = Color(red: 238, green: 238, blue:238
                , alpha: 1.0)
            sqareright.frame = Rect(sqareright.center,Size(squareCenter.width,225))
        }
        move.curve = .EaseOut
        move.animate()
        
    }
    func animatepolygon() {
        let regularPolygon = RegularPolygon(center: canvas.center, radius: 70.0, sides: 5, phase: 0.0)
        canvas.add(regularPolygon)
        regularPolygon.strokeColor = Color(red: 238, green: 238, blue:238
            , alpha: 1.0)
        regularPolygon.fillColor = Color(red: 238, green: 238, blue:238
            , alpha: 1.0)
        let move = ViewAnimation(duration: 1.0){
            regularPolygon.strokeEnd = 1
        }
        move.animate()
        regularPolygonnumber = 0
        wait(1.1){
            let disapper = ViewAnimation(duration:1.0){
                regularPolygon.strokeEnd = -1
            }
            disapper.animate()
            self.regularPolygonnumber = 1
        }
    }
    
    @IBAction func didTapCanvas(_ sender: Any){
        number = Int(arc4random_uniform(2))
        animateRectangle()
        
        
        //        if number == 1{
        //            animateShape()
        //            print("blueShape")
        //        }else if number == 2{
        //            animateRectangle()
        //            print("sqareRectangle")
        //        } else {
        //            animateWithBackground()
        //            print("Rect")
        //        }
    }
}



