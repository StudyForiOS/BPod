//
//  BView.swift
//  BPod
//
//  Created by ForJade Giant on 2019/2/25.
//

import UIKit
import BaseBusiness

class BView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let suBView = try! Bus.callData("APod/AView", params: "1233") as? UIView
        suBView?.frame = frame
        
        if let view = suBView {
            self.addSubview(view)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
