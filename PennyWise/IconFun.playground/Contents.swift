//: Playground - noun: a place where people can play

import UIKit

let size = CGSize(width: 400, height: 400)
let rect = CGRect(origin: .zero, size: size)

let backgroundColor = UIColor.red
let drawingColor = UIColor.black

let lineWidth:CGFloat = 5.0

UIGraphicsBeginImageContextWithOptions(size, false, 0.0)

let context = UIGraphicsGetCurrentContext()!

let edge = UIBezierPath(roundedRect: rect.insetBy(dx: lineWidth/2, dy: lineWidth/2), cornerRadius: 50)

context.saveGState()

  edge.addClip()


backgroundColor.setFill()
UIRectFill(rect)

context.restoreGState()

edge.lineWidth = lineWidth
drawingColor.setStroke()
edge.stroke()

let outerCircle = UIBezierPath(ovalIn: CGRect(x: 46, y: 46, width: 310, height: 310))
outerCircle.lineWidth = lineWidth
outerCircle.stroke()

let eye1 = UIBezierPath(ovalIn: CGRect(x: 138, y: 126, width: 36, height: 72))
eye1.lineWidth = lineWidth
eye1.stroke()

let eye2 = UIBezierPath(ovalIn: CGRect(x: 223, y: 126, width: 36, height: 72))
eye2.lineWidth = lineWidth
eye2.stroke()

let mouth = UIBezierPath()
mouth.lineWidth = lineWidth
mouth.move(to: CGPoint(x: 136, y: 250))
mouth.addLine(to: CGPoint(x: 265, y: 250))
mouth.addCurve(to: CGPoint(x: 135, y: 250),
  controlPoint1: CGPoint(x: 240, y: 300),
  controlPoint2: CGPoint(x: 150, y: 300))
mouth.close()
mouth.lineJoinStyle = .round

mouth.stroke()

let path = UIBezierPath()
path.append(outerCircle)
path.append(eye1)
path.append(eye2)
path.append(mouth)

let image = UIGraphicsGetImageFromCurrentImageContext()
UIGraphicsEndImageContext()
image


UIGraphicsBeginImageContextWithOptions(size, false, 0.0)

path.stroke()

let image2 = UIGraphicsGetImageFromCurrentImageContext()
UIGraphicsEndImageContext()
image2

