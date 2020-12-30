# FloatingView
A library for injecting and managing a floating view in the navigation controller view hierarchy.

## Features
This library lets you add a floating view at the navigation controller level 
- ❌ No need to subclass your nav controller
- ❌ No view logic in your nav controller
- ✅ Customization hooks whenever a view controller is shown

## Usage

### Setup

```swift
let floatingButton = ...
let floatingViewManager = FloatingViewManager(floatingView: floatingButton)
let nav = UINavigationController(rootViewController: vc, floatingViewManager: floatingViewManager)
```

### Customizing

View controllers pushed onto the navigation stack can customize by conforming to `FloatingViewCustomizing` and implementing functions.

```swift
protocol FloatingViewCustomizing {
    func shouldShowButton() -> Bool
    func createConstraints(floatingView: UIView, superview: UIView)
}
```
