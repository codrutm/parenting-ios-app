//
//  QuoteTableViewCell.swift
//  Citate
//
//  Created by Ungurean Valentina on 07.01.2022.
//

import UIKit

class QuoteTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(favoriteImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(authorLabel)
        self.contentView.addSubview(containerView)
        
        favoriteImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        favoriteImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        favoriteImageView.widthAnchor.constraint(equalToConstant:30).isActive = true
        favoriteImageView.heightAnchor.constraint(equalToConstant:30).isActive = true
        
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.favoriteImageView.trailingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        
        containerView.topAnchor.constraint(equalTo:self.contentView.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: titleLabel.heightAnchor, constant: 40).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        authorLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        authorLabel.topAnchor.constraint(equalTo:self.titleLabel.bottomAnchor, constant:5).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    let favoriteImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.clipsToBounds = true
        img.image = UIImage(systemName: "heart.fill")
        img.tintColor = UIColor(named: "BrandLightBlue")
        return img
    }()
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let authorLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0.2078431373, green: 0.4705882353, blue: 0.737254902, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()

    var quote:Quote? {
        didSet {
            guard let item = quote else {return}
            titleLabel.text = "\"\(item.title) \""
            authorLabel.text = item.author
        }
    }
}
