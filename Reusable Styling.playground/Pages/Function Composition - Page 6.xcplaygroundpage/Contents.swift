//: [Previous](@previous)
import UIKit
import PlaygroundSupport
//: ## Function Composition
/// Styling that works with all UIViews...
func roundedStyle(_ view: UIView) {
    view.clipsToBounds = true
    view.layer.cornerRadius = 3
}
func filledStyle(backgroundColor: UIColor = .c1Green, tintColor: UIColor = .white) -> (UIView) -> Void {
    return {
        $0.backgroundColor = backgroundColor
        $0.tintColor = tintColor
    }
}
func borderStyle(color: UIColor = .c1Blue, borderWidth: CGFloat = 2) -> (UIView) -> Void {
    return {
        $0.layer.borderColor = color.cgColor
        $0.layer.borderWidth = borderWidth
    }
}

/// Styling for our UIButtons
let baseButtonStyle: (UIButton) -> Void = {
    $0.contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
}
let roundedButtonStyle = baseButtonStyle <> roundedStyle
let filledButtonStyle = roundedButtonStyle <> filledStyle()
let borderButtonStyle = roundedButtonStyle <> borderStyle() <> { $0.setTitleColor(UIColor.c1Blue, for: .normal) }

final class MyViewController : UIViewController {
    override func loadView() {
        
        let view = UIView()
        view.backgroundColor = .white
        
        let usernameField = UITextField()
        usernameField.layer.borderColor = UIColor(white: 0.75, alpha: 1).cgColor
        usernameField.layer.borderWidth = 1
        usernameField.borderStyle = .roundedRect
        usernameField.clipsToBounds = true
        usernameField.layer.cornerRadius = 3
        usernameField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        usernameField.placeholder = "Username"
        
        let passwordField = UITextField()
        passwordField.layer.borderColor = UIColor(white: 0.75, alpha: 1).cgColor
        passwordField.layer.borderWidth = 1
        passwordField.borderStyle = .roundedRect
        passwordField.clipsToBounds = true
        passwordField.layer.cornerRadius = 3
        passwordField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        passwordField.placeholder = "Password"
        
        let signInButton = UIButton(type: .system)
        filledButtonStyle(signInButton)
        signInButton.setTitle("Sign In", for: .normal)
        
        let learnMoreButton = UIButton(type: .system)
        filledButtonStyle(learnMoreButton)
        learnMoreButton.backgroundColor = UIColor.c1Blue
        learnMoreButton.setTitle("Learn More", for: .normal)
        
        let benefitsButton = UIButton(type: .system)
        borderButtonStyle(benefitsButton)
        benefitsButton.setTitle("See All Card Benefits", for: .normal)
        
        let rootStackView = UIStackView(arrangedSubviews: [
            usernameField,
            passwordField,
            signInButton,
            learnMoreButton,
            benefitsButton
            ])
        
        rootStackView.axis = .vertical
        // Pins content to the relevant margin instead of its edge
        rootStackView.isLayoutMarginsRelativeArrangement = true
        rootStackView.layoutMargins = UIEdgeInsets(top: 32, left: 16, bottom: 32, right: 16)
        rootStackView.spacing = 16
        rootStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rootStackView)
        
        NSLayoutConstraint.activate([
            rootStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rootStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rootStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        
        self.view = view
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
