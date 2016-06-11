//
//  Code.swift
//  Pods
//
//  Created by Phan An on 6/11/16.
//
//

import UIKit

class Code: NSObject {

}
@IBDesignable class BWGradientView: UIView {
    
    
    @IBInspectable var startColor : UIColor = UIColor.whiteColor(){
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var endColor : UIColor = UIColor.blackColor(){
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var isHorizontal: Bool = false{
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var roundness : CGFloat = 0.0{
        didSet{
            setupView()
        }
    }
    
    
    override class func layerClass() -> AnyClass{
        return CAGradientLayer.self
    }
    
    private func setupView(){
        let color: Array = [startColor.CGColor, endColor.CGColor]
        
        gradientLayer.cornerRadius = roundness
        gradientLayer.colors = color
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        
        if isHorizontal {
            gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        }
        else{
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        }
        
        self.setNeedsDisplay()
        
    }
    
    // Help to return the main layer as CAGradientLayer
    var gradientLayer: CAGradientLayer{
        return layer as! CAGradientLayer
    }
    
}

