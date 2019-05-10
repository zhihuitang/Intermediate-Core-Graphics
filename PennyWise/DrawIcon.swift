/*
* Copyright (c) 2016 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

let drawingSize = CGSize(width: 400, height: 400)

class DrawIcon {
  
  class func drawAutoIcon() -> UIBezierPath {
    
    UIGraphicsBeginImageContextWithOptions(drawingSize, false, 0.0)
    
    //// Bezier Drawing
    let window = UIBezierPath()
    window.move(to: CGPoint(x: 54.24, y: 163.06))
    window.addCurve(to: CGPoint(x: 107.83, y: 146.83), controlPoint1: CGPoint(x: 71.29, y: 144.12), controlPoint2: CGPoint(x: 107.83, y: 146.83))
    window.addCurve(to: CGPoint(x: 193.47, y: 77.5), controlPoint1: CGPoint(x: 107.83, y: 146.83), controlPoint2: CGPoint(x: 135, y: 77.5))
    window.addCurve(to: CGPoint(x: 282.11, y:  147.7), controlPoint1: CGPoint(x: 251.93, y: 77.5), controlPoint2: CGPoint(x: 282.11, y: 147.7))
    window.addCurve(to: CGPoint(x: 351.45, y:  163.06), controlPoint1: CGPoint(x: 282.11, y: 147.7), controlPoint2: CGPoint(x: 331.96, y: 144.12))
    window.addCurve(to: CGPoint(x: 366.07, y:  222.58), controlPoint1: CGPoint(x: 370.94, y: 182), controlPoint2: CGPoint(x: 366.07, y: 222.58))
    window.addLine(to: CGPoint(x: 39.62, y: 222.58))
    window.addCurve(to: CGPoint(x: 54.24, y: 163.06), controlPoint1: CGPoint(x: 39.62, y: 222.58), controlPoint2: CGPoint(x: 37.18, y: 182))
    window.close()
    

    let wheel1 = UIBezierPath(ovalIn: CGRect(x: 86.5, y: 245.5, width: 70, height: 66))
    let wheel2 = UIBezierPath(ovalIn: CGRect(x: 244.5, y: 245.5, width: 70, height: 66))
    
    //// Bezier 2 Drawing
    let carBody = UIBezierPath()
    carBody.move(to: CGPoint(x: 188.8, y: 96.22))
    carBody.addLine(to: CGPoint(x: 188.8, y:  147.7))
    carBody.addLine(to: CGPoint(x: 258.78,  y: 147.7))
    carBody.addCurve(to: CGPoint(x: 235.46,  y: 114.94), controlPoint1: CGPoint(x: 258.78,  y: 147.7), controlPoint2: CGPoint(x: 252.95, y: 127.81))
    carBody.addCurve(to: CGPoint(x: 188.8,  y: 96.22), controlPoint1: CGPoint(x: 217.96,  y: 102.07), controlPoint2: CGPoint(x: 188.8,  y: 96.22))
    
    let path = UIBezierPath()
    path.append(window)
    path.append(wheel1)
    path.append(wheel2)
    path.append(carBody)
    
    UIGraphicsEndImageContext()
    return path
  }
  
  
  class func drawUtilitiesIcon() -> UIBezierPath {
    
    UIGraphicsBeginImageContextWithOptions(drawingSize, false, 0.0)
    
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 290, y: 29))
    path.addLine(to: CGPoint(x: 76, y: 146))
    path.addLine(to: CGPoint(x: 224, y: 203))
    path.addLine(to: CGPoint(x: 132, y: 361))
    path.addLine(to: CGPoint(x: 316, y: 187))
    path.addLine(to: CGPoint(x: 193, y: 131))
    path.addLine(to: CGPoint(x: 290, y: 29))
    path.close()
    
    UIGraphicsEndImageContext()
    return path
  }
  
  class func drawFunIcon() -> UIBezierPath {
    UIGraphicsBeginImageContextWithOptions(drawingSize, false, 0.0)
    
    let outerCircle = UIBezierPath(ovalIn: CGRect(x: 46, y: 46, width: 310, height: 310))
    let eye1 = UIBezierPath(ovalIn: CGRect(x: 138, y: 126, width: 36, height: 72))
    let eye2 = UIBezierPath(ovalIn: CGRect(x: 223, y: 126, width: 36, height: 72))
    let mouth = UIBezierPath()
    mouth.move(to: CGPoint(x: 135, y: 250))
    mouth.addLine(to: CGPoint(x: 265, y: 250))
    mouth.addCurve(to: CGPoint(x: 135, y: 250), controlPoint1: CGPoint(x: 240, y: 300), controlPoint2: CGPoint(x: 150, y: 300))
    
    let path = UIBezierPath()
    path.append(outerCircle)
    path.append(eye1)
    path.append(eye2)
    path.append(mouth)
    
    UIGraphicsEndImageContext()
    return path
  }
  
  class func drawGroceriesIcon() -> UIBezierPath {
    
    UIGraphicsBeginImageContextWithOptions(drawingSize, false, 0.0)
    
    let basket = UIBezierPath()
    basket.move(to: CGPoint(x: 36, y: 102))
    basket.addLine(to: CGPoint(x: 321, y: 102))
    basket.addLine(to: CGPoint(x: 337, y: 40))
    basket.addLine(to:CGPoint(x: 368, y: 25))
    
    basket.move(to: CGPoint(x: 41, y: 102))
    basket.addLine(to: CGPoint(x: 88, y: 226))
    basket.addLine(to: CGPoint(x: 280, y: 241))
    basket.addLine(to: CGPoint(x: 321, y: 102))
    
    //// Wheels
    let wheel1 = UIBezierPath(ovalIn: CGRect(x: 88, y: 305, width: 58, height: 58))
    let wheel2 = UIBezierPath(ovalIn: CGRect(x: 240, y: 305, width: 58, height: 58))
    
    
    //// Bezier 3 Drawing
    let cartBase = UIBezierPath()
    cartBase.move(to: CGPoint(x: 280, y: 249))
    cartBase.addCurve(to: CGPoint(x: 327, y: 269),
      controlPoint1: CGPoint(x: 280, y: 249),
      controlPoint2: CGPoint(x: 327, y: 233))
    cartBase.addCurve(to: CGPoint(x: 295, y: 290),
      controlPoint1: CGPoint(x: 327, y: 306), controlPoint2: CGPoint(x: 295, y: 290))
    cartBase.addLine(to: CGPoint(x: 72, y: 290))
    
    let path = UIBezierPath()
    path.append(basket)
    path.append(wheel1)
    path.append(wheel2)
    path.append(cartBase)
    
    UIGraphicsEndImageContext()
    
    return path
  }
  
  
  
  class func drawPetIcon() -> UIBezierPath {
    UIGraphicsBeginImageContextWithOptions(drawingSize, false, 0.0)
    
    let paw1 = UIBezierPath(ovalIn: CGRect(x: 130, y: 174, width: 140, height: 154))
    let paw2 = UIBezierPath(ovalIn: CGRect(x: 71, y: 104, width: 71, height: 89))
    let paw3 = UIBezierPath(ovalIn: CGRect(x: 161, y: 66, width: 71, height: 89))
    let paw4 = UIBezierPath(ovalIn: CGRect(x: 254, y: 104, width: 71, height: 89))
    let path = UIBezierPath()
    path.append(paw1)
    path.append(paw2)
    path.append(paw3)
    path.append(paw4)
    
    UIGraphicsEndImageContext()
    return path
  }
  
  class func drawMiscIcon() -> UIBezierPath {
    
    UIGraphicsBeginImageContextWithOptions(drawingSize, false, 0.0)
    
    let query = UIBezierPath()
    query.move(to: CGPoint(x: 128, y: 107))
    query.addCurve(to: CGPoint(x: 192, y: 37), controlPoint1: CGPoint(x: 128.5, y: 107.06), controlPoint2: CGPoint(x: 133.45, y: 37.5))
    query.addCurve(to: CGPoint(x: 272, y: 121.96), controlPoint1: CGPoint(x: 252.21, y: 37.5), controlPoint2: CGPoint(x: 281.9, y: 77.25))
    query.addCurve(to: CGPoint(x: 192.83, y: 201.45), controlPoint1: CGPoint(x: 262.11, y: 166.67), controlPoint2: CGPoint(x: 192.83, y: 201.45))
    query.addLine(to: CGPoint(x: 192.83, y: 295.85))
    
    let queryDot = UIBezierPath(ovalIn: CGRect(x: 177.5, y: 320.5, width: 30, height:30))
    
    let path = UIBezierPath()
    path.append(query)
    path.append(queryDot)
    
    UIGraphicsEndImageContext()
    return path
  }
  
  
}
