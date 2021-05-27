//
//  ViewController.swift
//  then_tutorial
//
//  Created by Jeff Jeong on 2021/05/28.
//

import UIKit
import Then

class ViewController: UIViewController {

    //MARK: - UI
    lazy var myLabel : UILabel = {
        let label = UILabel()
        label.text = "하하하"
        label.font = UIFont.boldSystemFont(ofSize: 100)
        label.textColor = UIColor.blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    lazy var mySubLabel = UILabel().then {
//        $0.text = "이것슨 then 사용한 것입니다.!!!"
//        $0.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
//        $0.textColor = UIColor.black
//        $0.translatesAutoresizingMaskIntoConstraints = false
//    }
//
    lazy var mySubLabel = UILabel().then { (myLabel : UILabel) in
        myLabel.text = "이것슨 then 사용한 것입니다.!!!"
        myLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        myLabel.textColor = UIColor.red
        myLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - LifeCycles
    override func loadView() {
        super.loadView()
        print(#fileID, #function, #line, "")
        configureUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#fileID, #function, #line, "")
    }
    
    /// UI를 설정
    fileprivate func configureUI(){
        print(#fileID, #function, #line, "")
        
        self.view.addSubview(myLabel)
        NSLayoutConstraint.activate([
            myLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            myLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        
        self.view.addSubview(mySubLabel)
        NSLayoutConstraint.activate([
            mySubLabel.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: 30),
            mySubLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
    }


}

// uikit 의 uiview 를 사용할수 있도록 한다.
// UIViewControllerRepresentable
// 전
#if DEBUG
import SwiftUI

struct MyVCRepresentable: UIViewControllerRepresentable {
    
    // ui Viewcontroller 만들기
    @available(iOS 13.0, *)
    func makeUIViewController(context: Context) -> some UIViewController {
        print(#fileID, #function, #line, "")
        return ViewController()
    }
    
    // 업데이트 ui View
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        print(#fileID, #function, #line, "")
    }
}

@available(iOS 13.0, *)
struct MyVCRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        MyVCRepresentable()
    }
}

#endif
