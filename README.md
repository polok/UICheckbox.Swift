<p align="center">
    <img src="https://github.com/polok/UICheckbox.Swift/blob/master/Resources/uicheckbox_logo.png" alt="Storage" />
</p>

<p align="center">
    <img src="https://img.shields.io/badge/platform-iOS%208%2B-blue.svg?style=flat" alt="Platform: iOS 8+" />
    <a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/language-swift2-f48041.svg?style=flat" alt="Language: Swift 2" /></a>
    <a href="https://cocoapods.org/pods/Pantry"><img src="https://img.shields.io/cocoapods/v/UICheckbox.Swift.svg?style=flat" alt="CocoaPods compatible" /></a>
    <img src="http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat" alt="License: MIT" />
</p>

<p align="center">
    <a href="#installation">Installation</a>
  • <a href="https://github.com/polok/UICheckbox.Swift/issues">Issues</a>
  • <a href="#license">License</a>
</p>

UICheckbox is simple as hell and lightweight class to add 'checkbox' UI component in iOS application. For now it inherits from UIButton but this probably will change in upcoming versions.

## Demo

<p align="center">
    <img src="https://github.com/polok/UICheckbox.Swift/blob/master/Resources/uicheckbox_example.png" alt="Demo UICheckbox" />
</p>

## Compatibility

UICheckbox requires iOS 8+ and is compatible with **Swift 3** projects (for Swift 2.3 support, please check swift-2.3 branch). Please, don't count for Objective-C support ;)

## Installation

As for [CocoaPods](https://cocoapods.org), use this to get the latest release:

```ruby
use_frameworks!

pod 'UICheckbox'
```

And `import UICheckbox` in the files you'd like to use it.

## Usage

A custom params available from Interface Builder
+ border width<br/>
    Border width of our UICheckbox
+ border color<br/>
    Border color of our UICheckbox
+ corner radius <br/>
    Radius if we don't want to have square UICheckbox
+ padding <br/>
    Padding of our UICheckbox to increase the 'touch' area (especially for smaller ones)

UICheckbox is a subclass of UIButton (at least for now), so you can add it by adding UIButton class and then just change the class to **UICheckbox**


Callback to be notified about UICheckbox state changes:

```swift
checkbox.onSelectStateChanged = { (checkbox, selected) in
    debugPrint("Clicked - \(selected)")
}
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Author
Marcin Polak - mpolak87(at).gmail.com


## Contribution
Feel free to fork the project and send us a pull-request! :sunglasses:

## License
UICheckbox is available under the MIT license. See the [LICENSE](https://github.com/polok/UICheckbox.Swift/blob/master/LICENSE) file for more info.