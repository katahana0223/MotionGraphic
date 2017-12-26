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
    
    private var squareRectangle:Rectangle!
    private var blueShape: Shape!
    var number: Int!
    
    private func createCircle() -> Circle {
        let rect = Rect(0, 0, 50, 50)
        return Circle(frame: rect)
    }
    override func setup() {
        canvas.backgroundColor = Color(red: 54, green: 79, blue:107
            , alpha: 1.0)
        ShapeLayer.disableActions = true
        loadShape()
        let square = Rectangle(frame: Rect(0, 0, 40, 250))
        square.center = canvas.center
        canvas.add(square)
    }
    
    
    func createShape(center: Point, color: Color, radius: Double) -> Shape {
        
        let shape = Circle(center: center, radius: radius)
        shape.lineWidth = 20.0
        shape.strokeColor = color
        shape.fillColor = clear
        
        return shape
        
    }
    var blueshapenumber: Int = 1
    
    override func viewWillAppear(_ animated: Bool) {
        //始まる方向を指定
        blueShape.rotation = -0.5 * Double.pi
        squareRectangle.rotation = -0.5 * Double.pi
    }
    
    func loadShape(){
        //radius円の大きさ
        blueShape = createShape(center: canvas.center, color: Color(red: 252, green: 81, blue:133, alpha: 1.0), radius: 55.0)
        blueShape.strokeStart = 0.0
        blueShape.strokeEnd = 0.001
        
    }
    
    func blueshape1(){
        self.canvas.add(blueShape)
        let move = ViewAnimation(duration: 1.0){
            self.blueShape.strokeEnd = 1
        }
        move.animate()
        blueshapenumber = 0
        wait(1.1){
            let disapper = ViewAnimation(duration:1.0){
                self.blueShape.strokeEnd = -1
            }
            disapper.animate()
            self.blueshapenumber = 1
            
        }
    }
    
    func rect(){
        
        let pink = createCircle()
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
        func squareRectangle1(center: Point, color: Color, radius: Double) -> Rectangle {
            let square = Circle(center: center, radius: radius)
            square.lineWidth = 20.0
            square.strokeColor = Color(red: 238, green: 238, blue:238
                , alpha: 1.0)
            square.fillColor = Color(red: 238, green: 238, blue:238
                , alpha: 1.0)
            return squareRectangle
        }
        var squareRectanglenumber: Int = 1
    }
    func squareRectangle2(){
        self.canvas.add(squareRectangle)
        let move = ViewAnimation(duration: 1.0){
            self.squareRectangle.strokeEnd = 1
        }
        move.animate()
        squareRectanglenumber = 0
        wait(1.1){
            let disapper = ViewAnimation(duration:1.0){
                self.squareRectangle.strokeEnd = -1
            }
            disapper.animate()
            self.squareRectanglenumber = 1
            
        }
    }
    
    @IBAction func didTapCanvas(_ sender: Any){
        number = Int(arc4random_uniform(2))
        if number == 1{
            blueshape1()
            print("blueShape")
        } else {
            rect()
            print("Rect")
        }
    }
}



