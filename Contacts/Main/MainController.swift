//
//  ViewController.swift
//  Contacts
//
//  Created by Эмир Кармышев on 19/2/22.
//

import UIKit
import SnapKit

struct KeysDefaults{
    static let keyName = "name"
    static let keyNumber = "number"
}

class MainController: UIViewController {
    private var document = MainDocument()
    
    private lazy var setupButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage.init(systemName: "plus" ), for: .normal)
        view.tintColor = .black
        view.backgroundColor = .white
        view.layer.cornerRadius = 48
        view.clipsToBounds = true
        view.addTarget(self, action: #selector(clickAddNumber(view:)), for: .touchUpInside)
        return view
    }()
    private lazy var table: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.register(ContactsCell.self, forCellReuseIdentifier: "MainCell")
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        setupView()
        document.getContact()
        table.reloadData()
    }
    
    @objc func clickAddNumber(view: UIButton){
        navigationController?.pushViewController(SetUpController(), animated: true)
    }

    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupSubViews() {
        view.addSubview(setupButton)
        setupButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.right.equalToSuperview()
            make.height.equalTo(view.frame.width / 6)
            make.width.equalTo(view.frame.width / 6)
        }
        view.addSubview(table)
        table.snp.makeConstraints { make in
            make.top.equalTo(setupButton.snp.bottom)
            make.height.equalTo(view.frame.height / 1.2)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
}

extension MainController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return document.contactArray.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = document.contactArray[indexPath.row]
        let cell = ContactsCell()
        cell.fill(model: model)
        return cell
    }
}
