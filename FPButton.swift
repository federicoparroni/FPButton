//
//  RoundedCornerButton.swift
//  ClaudiasClothes
//
//  Created by Federico Parroni on 20/05/16.
//  Copyright © 2016 Federico Parroni. All rights reserved.
//

import UIKit

@IBDesignable class FPButton: UIButton {

    @IBInspectable var isAlwaysChecked : Bool = false {
        didSet {
            if isAlwaysChecked {
                self.checked = true
            }
        }
    }
    @IBInspectable var checked : Bool = false {
        didSet {
            if checked {
                backgroundColor = borderColor
                titleLabel?.textColor = UIColor.whiteColor()
            } else {
                backgroundColor = uncheckedBackgroundColor
                titleLabel?.textColor = borderColor
            }
//            self.setNeedsDisplay()
        }
    }
    @IBInspectable var cornerRadius : Int = 5 {
        didSet {
            layer.cornerRadius = 5
        }
    }
    @IBInspectable var borderWidth : Int = 2 {
        didSet {
            layer.borderWidth = 2
        }
    }
    @IBInspectable var borderColor : UIColor = UIColor.clearColor() {
        didSet {
            layer.borderColor = borderColor.CGColor
        }
    }
    @IBInspectable var uncheckedBackgroundColor : UIColor = UIColor.clearColor()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addTarget(self, action: #selector(buttonPressed), forControlEvents: .TouchUpInside)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.highlighted = false
        
    }
    
    
    func buttonPressed() {
        UIView.animateWithDuration(0.2, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: .CurveEaseIn, animations: { () in
                self.transform = CGAffineTransformMakeScale(1.03, 1.03)
            }, completion: { (_) in
                if !self.isAlwaysChecked {
                    self.checked = !self.checked
                }
        })
        UIView.animateWithDuration(0.2, delay: 0.2, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: .CurveEaseIn, animations:  { () in
                self.transform = CGAffineTransformMakeScale(1, 1)
            }, completion: nil)
    }

    
}