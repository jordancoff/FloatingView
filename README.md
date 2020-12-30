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

### Customization

Customization is offered via the `FloatingViewCustomizing` protocol.

```swift
protocol FloatingViewCustomizing {
    func shouldShowButton() -> Bool
    func createConstraints(floatingView: UIView, superview: UIView)
}
```

For each hook offered through the protocol, customization can be done with the following order of precendence:
 - view controller being shown can conform to `FloatingViewCustomizing` and implement methods
 - navigation controller can conform to `FloatingViewCustomizing` and implement methods
 -  `default handler` property corresponding to the desired customization can be set on the manager
