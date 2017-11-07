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
    override func setup() {
        self.canvas.backgroundColor = black
        loadShape()
        
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
    
    @IBAction func didTapCanvas(_ sender: Any){
        let move = ViewAnimation(duration: 2.0){
            self.blueShape.strokeEnd = 1
            
            self.blueShape.strokeEnd = -1
        }
        move.animate()
    }
}
