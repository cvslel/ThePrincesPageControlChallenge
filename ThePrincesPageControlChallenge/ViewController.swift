//
//  ViewController.swift
//  ThePrincesPageControlChallenge
//
//  Created by Cenker Soyak on 3.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UIScrollViewDelegate {

    let pageControl = UIPageControl()
    let scrollView = UIScrollView()
    var contentTitle: UILabel!
    var subtitle: UILabel!
    var photo: UIImageView!
    
    var subtitles = ["Tuna", "Berk", "Cenker"]
    var titles = ["Prince", "King", "Soldier"]
    var images = ["pop1","pop2","pop3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createUI()
        setupUI()
    }
    func createUI(){
        contentTitle = UILabel()
        contentTitle.text = titles[0]
        contentTitle.font = .systemFont(ofSize: 26)
        contentTitle.textColor = .black
        view.addSubview(contentTitle)
        contentTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.left.equalTo(view.snp.left).offset(10)
            make.right.equalTo(view.snp.right).offset(-75)
            make.height.equalTo(30)
        }
        subtitle = UILabel()
        subtitle.text = subtitles[0]
        subtitle.font = .systemFont(ofSize: 15)
        subtitle.textColor = .darkGray
        view.addSubview(subtitle)
        subtitle.snp.makeConstraints { make in
            make.top.equalTo(contentTitle.snp.bottom).offset(10)
            make.left.equalTo(view.snp.left).offset(10)
            make.right.equalTo(view.snp.right).offset(10)
            make.height.equalTo(20)
        }
        photo = UIImageView()
        view.addSubview(photo)
        photo.image = UIImage(named: "pop1")
        photo.snp.makeConstraints { make in
            make.top.equalTo(contentTitle.snp.bottom).offset(90)
            make.left.equalTo(view.snp.left).offset(5)
            make.right.equalTo(view.snp.right).offset(-5)
            make.height.equalTo(400)
        }
    }

    func setupUI(){
        pageControl.numberOfPages = subtitles.count
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .blue
        pageControl.currentPage = 0
        pageControl.tintColor = .red
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.snp.bottom).inset(10)
        }
        pageControl.addTarget(self, action: #selector(changePage(_:)), for: .valueChanged)
        
    }
    @objc func changePage(_ sender: UIPageControl) {
        let current = sender.currentPage
        photo.image = UIImage(named: images[current])
        contentTitle.text = titles[current]
        subtitle.text = subtitles[current]
      }
}

