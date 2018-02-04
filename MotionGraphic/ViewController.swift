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
    var regularPolygonnumber: Int = 1
    var rectanglenumber: Int = 1
    var trianglenumber: Int = 1
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
        blueShape.lineWidth = 20
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
    func animatepolygon() {
        let regularPolygon = RegularPolygon(center: canvas.center, radius: 70.0, sides: 5, phase: -Double.pi/10)
        regularPolygon.lineWidth = 20.0
        regularPolygon.strokeColor = Color(red: 238, green: 238, blue:238
            , alpha: 1.0)
        regularPolygon.fillColor = clear
        regularPolygon.strokeStart = 0.0
        regularPolygon.strokeEnd = 0.001
        canvas.add(regularPolygon)
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
        
        let squareLeft = Rectangle(frame: Rect(0, 0, 40, 0))
        //場所指定
        let interval = (canvas.bounds.width-120)/4
        squareLeft.center = Point(canvas.center.x - interval - 20, canvas.center.y + 40)
        //角
        squareLeft.corner = Size(0,0)
        squareLeft.strokeColor = Color(red: 238, green: 238, blue:238
            , alpha: 1.0)
        squareLeft.fillColor = Color(red: 238, green: 238, blue:238
            , alpha: 1.0)
        self.canvas.add(squareLeft)
        
        
        let squareCenter = Rectangle(frame: Rect(0, 0, 40, 0))
        squareCenter.center = Point(canvas.center.x, canvas.center.y + 40)
        squareCenter.corner = Size(0,0)
        squareCenter.strokeColor = Color(red: 238, green: 238, blue:238
            , alpha: 1.0)
        squareCenter.fillColor = Color(red: 238, green: 238, blue:238
            , alpha: 1.0)
        self.canvas.add(squareCenter)
        
        
        let sqareright = Rectangle(frame: Rect(0, 0, 40, 0))
        sqareright.center = Point(canvas.center.x + interval + 20, canvas.center.y + 40)
        sqareright.corner = Size(0,0)
        sqareright.strokeColor = Color(red: 238, green: 238, blue:238
            , alpha: 1.0)
        sqareright.fillColor = Color(red: 238, green: 238, blue:238
            , alpha: 1.0)
        self.canvas.add(sqareright)
        
        let move = ViewAnimation(duration: 1.0){
            squareCenter.bounds = Rect(0, 0, 40, 200)
            squareCenter.strokeColor = Color(red: 238, green: 238, blue:238
                , alpha: 1.0)
            squareCenter.fillColor = Color(red: 238, green: 238, blue:238
                , alpha: 1.0)
            squareCenter.frame = Rect(Point(squareCenter.center.x-20,squareCenter.center.y-200),Size(squareCenter.width,200))
            
            
            squareLeft.bounds = Rect(0, 0, 40, 200)
            squareLeft.strokeColor = Color(red: 238, green: 238, blue:238
                , alpha: 1.0)
            squareLeft.fillColor = Color(red: 238, green: 238, blue:238
                , alpha: 1.0)
            squareLeft.frame = Rect(Point(squareLeft.center.x-20,squareLeft.center.y-200),Size(squareCenter.width,200))
            
            
            sqareright.bounds = Rect(0, 0, 40, 200)
            sqareright.strokeColor = Color(red: 238, green: 238, blue:238
                , alpha: 1.0)
            sqareright.fillColor = Color(red: 238, green: 238, blue:238
                , alpha: 1.0)
            sqareright.frame = Rect(Point(sqareright.center.x-20,sqareright.center.y-200),Size(squareCenter.width,200))
        }
        move.curve = .EaseOut
        move.animate()
        rectanglenumber = 0
        let disapper = ViewAnimation(duration:1.0){
            
        }
            disapper.animate()

        
        }
        func animateTriangle(){
            //最背面
            let points = [Point(0,100*sin(Double.pi/3)),Point(50,0),Point(100,100*sin(Double.pi/3))]
            let triangle = Triangle(points)
            triangle.center = canvas.center
            triangle.fillColor = C4Pink
            triangle.strokeColor = clear
            triangle.lineWidth = 1
            canvas.add(triangle)
            
            
            let points2 = [Point(0,100*sin(Double.pi/3)),Point(50,0),Point(100,100*sin(Double.pi/3))]
            let triangle2 = Triangle(points2)
            triangle2.center = canvas.center
            triangle2.strokeColor = clear
            triangle2.fillColor =  Color(red: 238, green: 238, blue:238
                , alpha: 1.0)
            triangle2.lineWidth = 1
            canvas.add(triangle2)
            
            //最前面
            let points3 = [Point(0,100*sin(Double.pi/3)),Point(50,0),Point(100,100*sin(Double.pi/3))]
            let triangle3 = Triangle(points3)
            triangle3.center = canvas.center
            triangle3.strokeColor = clear
            triangle3.fillColor = Color(red: 238, green: 238, blue:238
                , alpha: 1.0)
            triangle3.lineWidth = 1
            canvas.add(triangle3)
            
            
            let move = ViewAnimation(duration: 0.5){
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    let rotate = Transform.makeRotation(Double.pi/5)
                    triangle.transform = rotate
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    let rotate2 = Transform.makeRotation(Double.pi/5)
                    triangle2.transform = rotate2
                }
                
                let rotate3 = Transform.makeRotation(Double.pi/5)
                triangle3.transform = rotate3
            }
            move.animate()
            
            
        }
        
        
        @IBAction func didTapCanvas(_ sender: Any){
            number = Int(arc4random_uniform(3))
                    if number == 1{
                        animateShape()
                        print("blueShape")
                    }else if number == 2{
                        animateWithBackground()
                        print("Background")
                    } else{
                        animatepolygon()
                        print("polygon")
                    }
        }
}




