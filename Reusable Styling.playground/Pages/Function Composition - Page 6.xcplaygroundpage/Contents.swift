//: [Previous](@previous)
import UIKit
import PlaygroundSupport
//: ## Function Composition

precedencegroup ForwardApplication {
    associativity: left
}
precedencegroup SingleTypeComposition {
    associativity: right
    higherThan: ForwardApplication
}
infix operator <>: SingleTypeComposition

func <> <A: AnyObject>(f: @escaping (A) -> Void, g: @escaping (A) -> Void) -> (A) -> Void {
    return { a in
        f(a)
        g(a)
    }
}

func baseButtonStyle(_ button: UIButton) {
    button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
}

func roundedButtonStyle(_ button: UIButton) {
    button.clipsToBounds = true
    button.layer.cornerRadius = 3
}

func filledButtonStyle(_ button: UIButton) {
    button.backgroundColor = UIColor.c1Green
    button.tintColor = .white
}

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
        baseButtonStyle(signInButton)
        roundedButtonStyle(signInButton)
        filledButtonStyle(signInButton)
        //        signInButton.backgroundColor = UIColor.c1Green()
        //        signInButton.contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
        //        signInButton.clipsToBounds = true
        //        signInButton.layer.cornerRadius = 3
        //        signInButton.tintColor = .white
        //        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        signInButton.setTitle("Sign In", for: .normal)
        
        let learnMoreButton = UIButton(type: .system)
        baseButtonStyle(learnMoreButton)
        roundedButtonStyle(learnMoreButton)
        filledButtonStyle(learnMoreButton)
        learnMoreButton.backgroundColor = UIColor.c1Blue
        //        learnMoreButton.contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
        //        learnMoreButton.clipsToBounds = true
        //        learnMoreButton.layer.cornerRadius = 3
        //        learnMoreButton.tintColor = .white
        //        learnMoreButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        learnMoreButton.setTitle("Learn More", for: .normal)
        
        let benefitsButton = UIButton(type: .system)
        baseButtonStyle(benefitsButton)
        roundedButtonStyle(benefitsButton)
        benefitsButton.backgroundColor = .white
        //        benefitsButton.contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
        //        benefitsButton.clipsToBounds = true
        benefitsButton.layer.borderColor = UIColor.c1Blue.cgColor
        benefitsButton.layer.borderWidth = 2
        benefitsButton.layer.cornerRadius = 3
        benefitsButton.tintColor = UIColor.c1Blue
        //        benefitsButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
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
