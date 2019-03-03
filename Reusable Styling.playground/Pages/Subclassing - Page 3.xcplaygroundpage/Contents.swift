//: [Previous](@previous)
import UIKit
import PlaygroundSupport
//: ## Subclassing
//: The mechanism of basing an object or class upon another object or class, retaining similar implementation.
//: 1. Start by defining a base or abstract class that we should further subclass
class BaseButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//: 2. A specialized subclass of `BaseButton` which has rounded corners.
class RoundedButton: BaseButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        self.layer.cornerRadius = 3
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//: 3. A more specialized version of `BaseButton` which is filled with a color and has white tint.
//: Should `RoundedButton` inherit from `BaseButton` or `FilledButton`? We now have to think about the chain of hierarchy.
class FilledButton: RoundedButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.c1Green
        self.tintColor = .white
    }
    
    convenience init(fillColor: UIColor) {
        self.init(frame: CGRect())
        self.backgroundColor = fillColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
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
//: Button subclasses don’t play nicely with the `.system` type, so we’re going to have to give up some of the free functionality that we get from that button type when creating custom sublcasses...
        //let signInButton = BaseButton(type: .system)
        //let signInButton = FilledButton(type: .system)
        let signInButton = FilledButton()
//        signInButton.contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
//        signInButton.backgroundColor = UIColor.init(red: 18/255, green: 128/255, blue: 35/255, alpha: 1.0)
//        signInButton.clipsToBounds = true
//        signInButton.layer.cornerRadius = 3
//        signInButton.tintColor = .white
//        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        signInButton.setTitle("Sign In", for: .normal)
        
//        let learnMoreButton = BaseButton(type: .system)
        let learnMoreButton = RoundedButton()
//        learnMoreButton.contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
        learnMoreButton.backgroundColor = UIColor.c1Blue
//        learnMoreButton.clipsToBounds = true
//        learnMoreButton.layer.cornerRadius = 3
//        learnMoreButton.tintColor = .white
//        learnMoreButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        learnMoreButton.setTitle("Learn More", for: .normal)
//: We need another subclass to be able to handle a border style button...
        let benefitsButton = RoundedButton()
        benefitsButton.backgroundColor = .white
//        benefitsButton.contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
//        benefitsButton.clipsToBounds = true
        benefitsButton.layer.borderColor = UIColor.c1Blue.cgColor
        benefitsButton.layer.borderWidth = 2
//        benefitsButton.layer.cornerRadius = 3
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

//: [Next](@next)
