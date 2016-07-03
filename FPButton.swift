//
//  FPButton.swift
//
//  Created by Federico Parroni on 24/06/16.
//  Copyright © 2016 Federico Parroni. All rights reserved.
//

import UIKit

@IBDesignable public class FPButton: UIButton {

    // MARK: Properties
    
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
                setTitleColor(UIColor.whiteColor(), forState: .Normal)
                layer.borderColor = checkedColor.CGColor
                layer.backgroundColor = checkedColor.CGColor
            } else {
                setColor(uncheckedColor)
                layer.backgroundColor = UIColor.clearColor().CGColor
            }
        }
    }
    @IBInspectable var cornerRadius : CGFloat = 5 {
        didSet {
            layer.cornerRadius = 5
        }
    }
    @IBInspectable var borderWidth : CGFloat = 2 {
        didSet {
            layer.borderWidth = 2
        }
    }
    @IBInspectable var checkedColor : UIColor = UIColor.clearColor() {
        didSet {
            if checked {
                setColor(checkedColor)
            }
        }
    }
    @IBInspectable var uncheckedColor : UIColor = UIColor.clearColor() {
        didSet {
            if !checked {
                setColor(uncheckedColor)
            }
        }
    }
    
    // MARK: Init
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _init()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        _init()
    }
    init() {
        let defaultFrame = CGRect(x: 0, y: 0, width: 100, height: 44)
        super.init(frame: defaultFrame)
        _init()
    }
    
    private func _init() {
        setColor(UIColor.redColor())
        layer.borderWidth = self.borderWidth
        layer.cornerRadius = self.cornerRadius
        addTarget(self, action: #selector(FPButton.buttonClicked), forControlEvents: .TouchUpInside)
    }
    
    
    // MARK: Actions
    
    func buttonClicked() {
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
    
    
    // MARK: Helpers
    
    func setColor(color : UIColor) {
        setTitleColor(color, forState: .Normal)
        layer.borderColor = color.CGColor
    }
    
}
