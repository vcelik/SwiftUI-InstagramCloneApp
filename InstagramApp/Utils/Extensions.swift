//
//  Extensions.swift
//  InstagramApp
//
//  Created by Volkan Celik on 01/08/2023.
//

import UIKit

extension UIApplication{
    
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
