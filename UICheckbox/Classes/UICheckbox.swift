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

@IBDesignable open class UICheckbox: UIButton {

    /*
    * Variable describes UICheckbox padding
    */
    @IBInspectable var padding: CGFloat = CGFloat(15)

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
    @IBInspectable var borderColor: UIColor = UIColor.lightGray {
        didSet {
            layer.borderColor = borderColor.cgColor
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
    override open var isSelected: Bool {
        didSet {
            super.isSelected = isSelected
            onSelectStateChanged?(self, isSelected)
        }
    }

    /*
    * Callback for handling checkbox status change
    */
    open var onSelectStateChanged: ((_ checkbox: UICheckbox, _ selected: Bool) -> Void)?


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
    
    /*
     * Increase UICheckbox 'clickability' area for better UX
     */
    override open func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        
        let newBound = CGRect(
            x: self.bounds.origin.x - padding,
            y: self.bounds.origin.y - padding,
            width: self.bounds.width + 2 * padding,
            height: self.bounds.width + 2 * padding
        )
        
        return newBound.contains(point)
    }
    
    override open func prepareForInterfaceBuilder() {
        setTitle("", for: UIControlState())
    }
    
}

// MARK: Private methods

public extension UICheckbox {

    fileprivate func initDefaultParams() {
        addTarget(self, action: #selector(UICheckbox.checkboxTapped), for: .touchUpInside)
        setTitle(nil, for: UIControlState())

        clipsToBounds = true

        setCheckboxImage()
    }

    fileprivate func setCheckboxImage() {
        let frameworkBundle = Bundle(for: UICheckbox.self)
        let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent("UICheckbox.bundle")
        let resourceBundle = Bundle(url: bundleURL!)
        let image = UIImage(named: "ic_check_3x", in: resourceBundle, compatibleWith: nil)
        imageView?.contentMode = .scaleAspectFit

        setImage(nil, for: UIControlState())
        setImage(image, for: .selected)
        setImage(image, for:  .highlighted)

    }

    @objc fileprivate func checkboxTapped(_ sender: UICheckbox) {
        isSelected = !isSelected
    }
}
