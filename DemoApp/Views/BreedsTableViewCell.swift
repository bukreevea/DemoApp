//
//  BreedsTableViewCell.swift
//  DemoApp
//
//  Created by Eugene on 28.07.2024.
//

import UIKit

class BreedsTableViewCell: UITableViewCell {
    
    private lazy var breedsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLable: UILabel = {
        let titleLable = UILabel()
        titleLable.font = .boldSystemFont(ofSize: 16)
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        return titleLable
    }()

    private lazy var subTitleLable: UILabel = {
        let subTitleLable = UILabel()
        subTitleLable.numberOfLines = 0
        subTitleLable.lineBreakMode = .byWordWrapping
        subTitleLable.font = .italicSystemFont(ofSize: 14)
        subTitleLable.translatesAutoresizingMaskIntoConstraints = false
        return subTitleLable
    }()
    
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with breeds: CatBreeds) {
        breedsImageView.image = breeds.image
        titleLable.text = breeds.name
        subTitleLable.text = breeds.temperament
    }
    
    //MARK: - private
    
    /// Настраиваем вид ячейки
    private func setupLayout(){
        let dataStackView = UIStackView(arrangedSubviews: [titleLable, subTitleLable])
        dataStackView.translatesAutoresizingMaskIntoConstraints = false
        dataStackView.axis = .vertical
        dataStackView.alignment = .fill
        
        contentView.addSubview(breedsImageView)
        contentView.addSubview(dataStackView)
        
        NSLayoutConstraint.activate([
            breedsImageView.heightAnchor.constraint(equalToConstant: 100),
            breedsImageView.widthAnchor.constraint(equalToConstant: 100),
            breedsImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            breedsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            breedsImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            dataStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            dataStackView.leadingAnchor.constraint(equalTo: breedsImageView.trailingAnchor, constant: 5),
            dataStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            dataStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
