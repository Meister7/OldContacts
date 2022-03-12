import Foundation
import UIKit

class ContactsCell: UITableViewCell{

    private lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 18, weight: .bold)
        return view
    }()
    

    
    private lazy var phoneNumberLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 18, weight: .regular)
        return view
    }()

    override func layoutSubviews() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(20)
        }
        addSubview(phoneNumberLabel)
        phoneNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(30)
            make.bottom.equalToSuperview()
        }
    }
    func fill(model: ContactsModel){
        self.nameLabel.text = model.name
        self.phoneNumberLabel.text = model.phoneNumber
    }
}

