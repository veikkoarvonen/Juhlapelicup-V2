//
//  DelegateProtocols.swift
//  Juomapeli
//
//  Created by Veikko Arvonen on 26.6.2024.
//

import Foundation

protocol CellDelegate: AnyObject {
    func deleteCell(at index: Int)
    func addPlayer(name: String, row: Int)
}

protocol nameTableViewDelegate: AnyObject {
    func setPlaceholder()
}

protocol valueDelegate: AnyObject {
    func setValue(to: Float, forTier: Bool)
}

protocol LanguageReloader {
    func reloadUILanguage()
}
