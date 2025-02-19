//
//  Loopable.swift
//  OpenMarket
//
//  Created by kjs on 2021/08/17.
//

import Foundation

protocol Loopable {
    var properties: [String: Any] { get }
}

extension Loopable {
    var properties: [String: Any] {
        var dictionary = [String: Any]()
        
        let mirror = Mirror(reflecting: self)
        
        guard let style = mirror.displayStyle,
              (style == .class || style == .struct) else {
            return dictionary
        }
        
        for (rawKey, value) in mirror.children {
            guard let rawKey = rawKey else { continue }
            
            var key = ""
            
            for character in rawKey {
                key += snakedStringIfCamel(character)
            }
            
            let valueMirror = Mirror(reflecting: value)
            
            if valueMirror.displayStyle == .optional {
                if let optional = valueMirror.children.first {
                    dictionary[key] = optional.value
                }
            } else {
                dictionary[key] = value
            }
        }
        
        return dictionary
    }
    
    func buildedFormData(boundary: String) -> Data {
        var form = ""
        
        for (key, value) in self.properties {
            form += boundary + .newLine
            form += "Content-Disposition: form-data; "
            form += "name=\"\(key)\"" + .newLine + .newLine
            form += "\(String(describing: value))" + .newLine
        }
        
        form += boundary + "--"
        
        return form.data(using: .utf8) ?? Data()
    }
    
    private func snakedStringIfCamel(_ character: Character) -> String {
        if character.isUppercase {
            return "_" + character.lowercased()
        } else {
            return character.description
        }
    }
}
