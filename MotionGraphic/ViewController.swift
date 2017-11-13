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
    
    private var blueShape: Shape!
    ShapeLayer.disableActions = true
    
    override func setup() {
        self.canvas.backgroundColor = black
        loadShape()
        
        let orange = createCircle()
        let orrangeColor = Color(red: 226.0/255.0, green: 122.0/255.0, blue: 4.0/255.0, alpha: 1)
        orange.fillColor = orangeColor
        orange.strokeColor = orrangeColor
        orange.center = canvas.center
        canvas.add(orange)
        let orangeAnim = ViewAnimation(duration: 1.0) {
            orange.transform = scale
            orange.fillColor = fadeOutColor
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        //始まる方向を指定
        blueShape.rotation = -0.5 * M_PI
    }
    func loadShape(){
        //radius円の大きさ
        blueShape = createShape(center: canvas.center, color: Color(0x00E5FF), radius: 50.0)
        blueShape.strokeStart = 0.0
        blueShape.strokeEnd = 0.001
    }
    func createShape(center: Point, color: Color, radius: Double) -> Shape {
        let shape = Circle(center: center, radius: radius)
        shape.lineWidth = 20.0
        shape.strokeColor = color
        shape.fillColor = clear
        self.canvas.add(shape)
        return shape
    }
    
    var blueshapenumber: Int = 1
    
    @IBAction func didTapCanvas(_ sender: Any){
        
    }
    func blueshape1(){
        if blueshapenumber == 1 {
            let move = ViewAnimation(duration: 2.0){
                self.blueShape.strokeEnd = 1
            }
            move.animate()
            blueshapenumber = 0
        }else{
            let disappear = ViewAnimation(duration: 2.0){
                self.blueShape.strokeEnd = -1
            }
            disappear.animate()
        }
    }
    
}

