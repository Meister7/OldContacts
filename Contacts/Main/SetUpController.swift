//
//  SetUpController.swift
//  Contacts
//
//  Created by Эмир Кармышев on 19/2/22.
//

import UIKit
import SnapKit

class SetUpController: UIViewController {
    private lazy var firstNameTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = .lightGray
        view.placeholder = "First Name"
        view.textColor = .black
        view.borderStyle = .roundedRect
        view.font = .systemFont(ofSize: 14, weight: .semibold)
        return view
    }()
    private lazy var secondNameTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Second Name"
        view.textColor = .black
        view.backgroundColor = .lightGray
        view.borderStyle = .roundedRect
        view.font = .systemFont(ofSize: 14, weight: .semibold)
        return view
    }()
    private lazy var phoneNumberTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Phone Number"
        view.textColor = .black
        view.backgroundColor = .lightGray
        view.borderStyle = .roundedRect
        view.font = .systemFont(ofSize: 14, weight: .semibold)
        return view
    }()
    private lazy var doneButton: UIButton = {
        let view = UIButton()
        view.setTitle("Done", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.backgroundColor = .lightGray
        view.clipsToBounds = true
        view.addTarget(self, action: #selector(clickDone(view:)), for: .touchUpInside)
        return view
    }()
    private lazy var ContactsLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 14, weight: .bold)
        view.backgroundColor = .lightGray
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        setupView()
    }
    @objc func clickDone(view: UIButton){
        SetUpDocument.shared.saveContact(model: ContactsModel(name: firstNameTextField.text ?? "", firstName: secondNameTextField.text ?? "", phoneNumber: phoneNumberTextField.text ?? ""))
        navigationController?.pushViewController(MainController(), animated: true)
    }
    private func setupView() {
        view.backgroundColor = .lightGray
    }
    private func setupSubViews() {
        view.addSubview(firstNameTextField)
        firstNameTextField.snp.makeConstraints { make in
//            make.top.equalTo(ContactsLabel.snp.bottom).offset(30)
            make.top.equalToSuperview().offset(50)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(20)
            make.height.equalTo(view.frame.width / 10)
            make.width.equalToSuperview()
        }
        view.addSubview(secondNameTextField)
        secondNameTextField.snp.makeConstraints { make in
            make.top.equalTo(firstNameTextField.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(20)
            make.height.equalTo(view.frame.width / 10)
            make.width.equalToSuperview()
        }
        view.addSubview(phoneNumberTextField)
        phoneNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(secondNameTextField.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(20)
            make.height.equalTo(view.frame.width / 10)
            make.width.equalToSuperview()
        }
        view.addSubview(doneButton)
        doneButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview()
            make.height.equalTo(view.frame.width / 8)
            make.width.equalTo(view.frame.width / 8)
        }
//        view.addSubview(ContactsLabel)
//        ContactsLabel.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(10)
//            make.centerX.equalToSuperview()
//        }
    }
}

