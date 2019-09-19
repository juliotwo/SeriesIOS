//
//  Validation.swift
//  Series
//
//  Created by julio vargas bautista on 9/6/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import Foundation
func validateWithRegex(_ text: String,_ regex: String) -> Bool {
    let range = NSRange(location: 0, length: text.count)
    let regex = try? NSRegularExpression(pattern: regex)
    return regex?.firstMatch(in: text, options: [], range: range) != nil
}
class ValidationError: Error {
    var message: String
    
    init(_ message: String) {
        self.message = message
    }
}

protocol ValidatorConvertible {
    func validated(_ value: String) throws -> String
}

enum ValidatorType {
    case email
    case password
    case name
    case lastName
}

enum VaildatorFactory {
    static func validatorFor(type: ValidatorType) -> ValidatorConvertible {
        switch type {
        case .email: return EmailValidator()
        case .password: return PasswordValidator()
        case .name: return NameValidator()
        case .lastName: return LastNameValidator()
        }
    }
}

struct NameValidator: ValidatorConvertible {
    func validated(_ value: String) throws -> String {
        guard value.count >= 3 else {
            throw ValidationError("El nombre debe contener mas de 3 caracteres" )
        }
        guard value.count < 18 else {
            throw ValidationError("El nombre no debe contener mas de 18 caracteres" )
        }
        
        do {
            if try NSRegularExpression(pattern: "^[a-z]{1,18}$",  options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                throw ValidationError("Invalid Name, Name should not contain whitespaces, numbers or special characters")
            }
        } catch {
            throw ValidationError("Nombre invalido, el nombre no puede contener espacios,  o caracteres especiales")
        }
        return value
    }
}

struct LastNameValidator: ValidatorConvertible {
    func validated(_ value: String) throws -> String {
        guard value.count >= 3 else {
            throw ValidationError("Lastname must contain more than three characters" )
        }
        guard value.count < 18 else {
            throw ValidationError("Lastname shoudn't conain more than 18 characters" )
        }
        
        do {
            if try NSRegularExpression(pattern: "^[a-z]{1,18}$",  options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                throw ValidationError("Invalid Lastname, Lastname should not contain whitespaces, numbers or special characters")
            }
        } catch {
            throw ValidationError("Invalid Lastname, Lastname should not contain whitespaces,  or special characters")
        }
        return value
    }
}

struct PasswordValidator: ValidatorConvertible {
    func validated(_ value: String) throws -> String {
        guard value != "" else {throw ValidationError("Contraseña requerida")}
        guard value.count >= 6 else { throw ValidationError("Password must have at least 6 characters") }
        
        do {
            if try NSRegularExpression(pattern: "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$",  options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                throw ValidationError("Password must be more than 6 characters, with at least one character and one numeric character")
            }
        } catch {
            throw ValidationError("Password must be more than 6 characters, with at least one character and one numeric character")
        }
        return value
    }
}

struct EmailValidator: ValidatorConvertible {
    func validated(_ value: String) throws -> String {
        do {
            if try NSRegularExpression(pattern: "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                throw ValidationError("Invalid e-mail Address")
            }
        } catch {
            throw ValidationError("Invalid e-mail Address")
        }
        return value
    }
}
