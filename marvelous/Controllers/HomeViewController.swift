import UIKit
import CollectionViewPagingLayout

class HomeViewController: UIViewController{
    var collectionView: UICollectionView!
    var charactersList: [Character] = [Character]()
    var currentOffset: Int = 0
    
    let refreshButton: UIButton = {
        var filled = UIButton.Configuration.filled()
        filled.title = "Refresh Characters"
        filled.image = UIImage(systemName: "arrow.clockwise.circle.fill")
        filled.imagePlacement = .trailing
        filled.imagePadding = 10
        filled.background.backgroundColor = UIColor(hexString: "#f78f3f")
        filled.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 15)
        let button = UIButton(configuration: filled)
        button.titleLabel?.font  = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func fetchData(){
        APICaller.shared.getCharactersData (offset: currentOffset) { result in
            switch result {
            case .success(let characterData):
                DispatchQueue.main.async {
                    let filteredList = characterData.filter { !($0.description.isEmpty) }

                    self.charactersList = filteredList
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        currentOffset += 50
    }
    
    func configureButton() {
        let buttonConstraint = [
            refreshButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            refreshButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            refreshButton.heightAnchor.constraint(equalToConstant: 50),
        ]
        refreshButton.addAction(UIAction(handler: { [weak self] _ in
            self?.scrollToBeginning()
         }), for: .primaryActionTriggered)
        
        NSLayoutConstraint.activate(buttonConstraint)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        fetchData()
        view.addSubview(refreshButton)
        configureButton()
        var marvelousLogo = UIImage(named: "appLogo")
        marvelousLogo = marvelousLogo?.withRenderingMode(.alwaysOriginal)
        let logoView = UIImageView()
        logoView.image = marvelousLogo
        logoView.contentMode = .scaleAspectFill
        navigationItem.titleView = logoView
    }
    
    override func viewDidLayoutSubviews() {
        collectionView.frame = view.bounds
    }
    
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension HomeViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        charactersList.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as? HomeCell else { return UICollectionViewCell()}
        cell.configure(with: charactersList[indexPath.row])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CharacterDetailsViewController()
        vc.hidesBottomBarWhenPushed = true
        vc.configure(with: charactersList[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
    
    public func scrollToBeginning() {
        fetchData()
        collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .left, animated: true)
    }
    
    private func setupCollectionView() {
        let layout = CollectionViewPagingLayout()
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
}
