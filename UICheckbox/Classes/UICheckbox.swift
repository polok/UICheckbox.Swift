//
//  UICheckbox.swift
//  UICheckbox
//
//  The MIT License (MIT)
//
//  Copyright (c) 2016 Marcin Polak. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import UIKit

@IBDesignable public class UICheckbox: UIButton {

   /*
   * Variable describes UICheckbox border width
   */
    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    /*
    * Variable stores UICheckbox border color
    */
    @IBInspectable var borderColor: UIColor = UIColor.lightGrayColor() {
        didSet {
            layer.borderColor = borderColor.CGColor
        }
    }

    /*
    * Variable stores UICheckbox border radius
    */
    @IBInspectable var cornerRadius: CGFloat = 5.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    /*
    * Variable to store current UICheckbox select status
    */
    override public var selected: Bool {
        didSet {
            super.selected = selected
            onSelectStateChanged?(checkbox: self, selected: selected)
        }
    }

    /*
    * Callback for handling checkbox status change
    */
    public var onSelectStateChanged: ((checkbox: UICheckbox, selected: Bool) -> Void)?


    // MARK: Init

    /*
    * Create a new instance of a UICheckbox
    */
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initDefaultParams()
    }

    /*
    * Create a new instance of a UICheckbox
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        initDefaultParams()
    }
    
    override public func prepareForInterfaceBuilder() {
        setTitle("", forState: .Normal)
    }
    
}

// MARK: Private methods

public extension UICheckbox {

    private func initDefaultParams() {
        addTarget(self, action: #selector(UICheckbox.checkboxTapped), forControlEvents: .TouchUpInside)
        setTitle(nil, forState: .Normal)

        clipsToBounds = true

        setCheckboxImage()
    }

    private func setCheckboxImage() {
        let frameworkBundle = NSBundle(forClass: UICheckbox.self)
        let bundleURL = frameworkBundle.resourceURL?.URLByAppendingPathComponent("UICheckbox.bundle")
        let resourceBundle = NSBundle(URL: bundleURL!)
        let image = UIImage(named: "ic_check_3x", inBundle: resourceBundle, compatibleWithTraitCollection: nil)
        imageView?.contentMode = .ScaleAspectFit

        setImage(nil, forState: .Normal)
        setImage(image, forState: .Selected)
        setImage(image, forState:  .Highlighted)

    }

    @objc private func checkboxTapped(sender: UICheckbox) {
        selected = !selected
    }
}
