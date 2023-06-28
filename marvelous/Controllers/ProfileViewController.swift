import UIKit

class ProfileViewController: UIViewController {
    
    let button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("Sign Out", for: .normal)
        button.backgroundColor = .systemRed
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 40),
        ])
        button.addTarget(self, action: #selector(trySignOut), for: .touchUpInside)
    }
    
    
    @objc func trySignOut() {
        AuthManager.shared.signOut { error in
            if let error = error {
                AlertManager.showLogoutError(on: self, with: error)
                return
            }
            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                sceneDelegate.checkAuthentication()
            }
        }
    }
}
