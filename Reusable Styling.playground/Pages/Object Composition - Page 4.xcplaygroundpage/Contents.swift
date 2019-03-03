//: [Previous](@previous)
import UIKit
import PlaygroundSupport

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
        signInButton.contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
        signInButton.backgroundColor = UIColor.init(red: 18/255, green: 128/255, blue: 35/255, alpha: 1.0)
        signInButton.clipsToBounds = true
        signInButton.layer.cornerRadius = 3
        signInButton.tintColor = .white
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        signInButton.setTitle("Sign In", for: .normal)
        
        let learnMoreButton = UIButton(type: .system)
        learnMoreButton.contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
        learnMoreButton.backgroundColor = UIColor.init(red: 13/255, green: 116/255, blue: 175/255, alpha: 1.0)
        learnMoreButton.layer.cornerRadius = 3
        learnMoreButton.tintColor = .white
        learnMoreButton.tintColor = .white
        learnMoreButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        learnMoreButton.setTitle("Learn More", for: .normal)
        
        let rootStackView = UIStackView(arrangedSubviews: [
            usernameField,
            passwordField,
            signInButton,
            learnMoreButton
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

//: [Next](@next)
