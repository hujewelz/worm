//
//  ViewController.swift
//  worm
//
//  Created by huluobo on 04/18/2018.
//  Copyright (c) 2018 huluobo. All rights reserved.
//

import UIKit
import Worm

struct DemoRender: Render {
    var title: String
    
    func rend(_ component: TitleView) {
       component.titleLabel.text = title
    }
}



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let render = DemoRender(title: "Worm Demo")
        
        let av: TitleView = AView(frame: CGRect(x: 0, y: 100, width: 200, height: 200))
        av.backgroundColor = UIColor.black
        view.addSubview(av)
        av.config(with: render)
        
        let bv: TitleView = BView(frame: CGRect(x: 0, y: 300, width: 200, height: 200))
        bv.backgroundColor = UIColor.red
        view.addSubview(bv)
        bv.config(with: render)
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

class TitleView: UIView, Component {
    
    var titleLabel = UILabel()
}

class AView: TitleView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
    }
    
}

class BView: TitleView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.frame = CGRect(x: 0, y: 0, width: frame.width, height: 40)
    }
    
}
