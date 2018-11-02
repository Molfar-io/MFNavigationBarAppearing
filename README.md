# MFNavigationBarAppearing

![](https://github.com/Molfar-io/MFNavigationBarAppearing/blob/master/example_300.gif)

## Requirements
* Xcode 10+
* iOS 9.0+
* Swift 4.2

## Example

Open and run the MFNavigationBarAppearing.xcodeproj in Xcode and run to see example

## Installation

### CocoaPods

``` ruby
source "https://github.com/Molfar-io/MFPodSpecs.git"

pod 'MFNavigationBarAppearing'
```

### Manual

Add MFNavigationBarAppearing/**Code** folder into your project.

## Usage

```swift
import MFNavigationBarAppearing
```

You just need to implement **MFNavigationBarAppearer** protocol in your **UIViewController**:
```swift
//MARK: - MFNavigationBarAppearer
extension UIViewController: MFNavigationBarAppearer {
    
    var appearingScrollView: UIScrollView? {
        return scrollView
    }

    var navigationBarStartAppearingOffset: CGFloat {
        return collectionViewContainer.frame.height - collectionViewBottomSpacing
    }
    
    var navigationBarEndAppearingOffset: CGFloat? {
        return collectionViewContainer.frame.height
    }
    
    var appearingTitle: String? {
        return place.title?.uppercased()
    }
    
    var appearingTitleStartOffsetAfterAppearingNavBar: CGFloat? {
        return collectionViewContainer.frame.height + titleLabelTopSpacing
    }
    
    var appearingTitleEndOffsetAfterAppearingNavBar: CGFloat? {
        return collectionViewContainer.frame.height + placeTitleLabel.frame.height
    }
}
```

#### appearingScrollView
It's **UIScrollView** which we will use to hande content offset for calculation appearing state of navigation bar.

#### navigationBarStartAppearingOffset
The offset from the top of the screen, when you need to start navigation bar appearing.

#### navigationBarEndAppearingOffset

