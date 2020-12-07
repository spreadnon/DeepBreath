//
//  PathsView.swift
//  DeepBreath
//
//  Created by iOS123 on 2020/12/7.
//

import SwiftUI

struct PathsView: View {
    var body: some View {

        Heart111()
    }
}

extension CGRect {
    /// center of rect
    var center: CGPoint {
        return CGPoint(x: self.midX, y: self.midY)
    }
    /// if rect is not square take centered square to draw
    var centeredSquare: CGRect {
        let width = ceil(min(size.width, size.height))
        let height = width

        //let newOrigin = CGPoint(x: origin.x + (size.width - width) / 2, y: origin.y + (size.height - height) / 2)
        let newOrigin = CGPoint(x: 0, y: 0)
        let newSize = CGSize(width: width, height: height)
        return CGRect(origin: newOrigin, size: newSize)
    }
    
    func flatten() -> (CGFloat, CGFloat, CGFloat, CGFloat) {
        return (origin.x, origin.y, size.width, size.height)
    }
}

extension Angle {
    
    static let A180 = Angle(radians: .pi) //180
    
    static let A90 = Angle(radians: .pi/2) //90
    
    static let A270 = Angle(radians: (.pi/2) * 3) //270
    
    static let A360 = Angle(radians: .pi * 2) //360
}


struct Heart: Shape {
    func path(in rect: CGRect) -> Path {
        
        let (x, y, width, height) = rect.centeredSquare.flatten()
        let lowerPoint = CGPoint(x: x + width / 2, y: (y + height ))
        
        let path = Path { p in
            p.move(to: lowerPoint)
            
            p.addCurve(to: CGPoint(x: x, y: (y + (height / 4))),
                  control1: CGPoint(x: (x + (width / 2)), y: (y + (height * 3 / 4))),
                  control2: CGPoint(x: x, y: (y + (height / 2))))
            
            p.addArc(center: CGPoint(x: (x + (width / 4)), y: (y + (height / 4))),
                radius: (width / 4),
                startAngle: .A180,
                endAngle: .zero,
                clockwise: false)
            
            p.addArc(center: CGPoint(x: (x + (width * 3 / 4)), y: (y + (height / 4))),
                radius: (width / 4),
                startAngle: .A180,
                endAngle: .zero,
                clockwise: false)
            
            p.addCurve(to: lowerPoint,
                  control1: CGPoint(x: (x + width), y: (y + (height / 2))),
                  control2: CGPoint(x: (x + (width / 2)), y: (y + (height * 3 / 4))))
        }
        return path
    }
    
}

struct Heart111: Shape {
    func path(in rect: CGRect) -> Path {
        let height = rect.height
        let width = rect.width
        let path = Path { p in
            
            p.move(to: CGPoint(x: 0, y: 0))
            p.addQuadCurve(to: CGPoint(x: width, y: 28), control: CGPoint(x: width/3, y: -6))
            p.addLine(to: CGPoint(x: width, y: height+15))
            p.addQuadCurve(to: CGPoint(x: 0, y: height-15), control: CGPoint(x: width/3, y: 130))
        	
        }
        return path
    }
    
}


struct Arcqqq: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)

        return path
    }
}

struct Arc111: Shape {

    var height: CGFloat = 20
    var length: CGFloat = 80
    var startX: CGFloat = 0

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let midPoint: CGFloat = (startX + length) / 2
        let apex1: CGFloat = (startX + midPoint) / 2
        let apex2: CGFloat = (midPoint + length) / 2

        path.move(to: CGPoint(x: startX, y: height))

        path.addCurve(to: CGPoint(x: midPoint, y: 0), control1: CGPoint(x: apex1, y:
            height), control2: CGPoint(x: apex1, y: 0))

        path.addCurve(to: CGPoint(x: length, y: height), control1: CGPoint(x: apex2, y: 0), control2: CGPoint(x: apex2, y: height))


        return path
    }
}

struct PathsView_Previews: PreviewProvider {
    static var previews: some View {
        PathsView()
    }
}
