//
//  ViewController.swift
//  BackendForFrontend
//
//  Created by Zachary Buffington on 5/10/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let data = TextWithImageData(
            title: .init(
                text: "Lorem Ipsum",
                fontSize: 16,
                fontWeight: "normal",
                color: "black"
            ),
            subtitle: .init(
                text: "Dolor et amet...",
                fontSize: 12,
                fontWeight: "normal",
                color: "gray"
            ),
            image: .init(src: URL(string: "https://www.clerkie.io/static/alex-e0b46011967fc058ff8fdbac2599b55f.jpg")!),
            height: 120
        )
        
        let component = TextWithImageComponent()
        component.translatesAutoresizingMaskIntoConstraints = false
        component.setUp(with: data)
        view.addSubview(component)
    }
    
    
}

