//
//  MBCellProtocols.swift
//  BlinkIDUI
//
//  Created by Jure Čular on 11/12/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

import Foundation

protocol MBCellConfigurable {
    associatedtype DataType
    func configure(model: DataType)
}

protocol MBCellConfigurator {
    static var reuseId: String { get }
    func configure(cell: UITableViewCell)
}

class MBTableCellConfigurator<CellType: MBCellConfigurable, DataType>: MBCellConfigurator where CellType.DataType == DataType, CellType: UITableViewCell {
    static var reuseId: String { return String(describing: CellType.self) }
    let item: DataType
    
    init(item: DataType) {
        self.item = item
    }
    
    func configure(cell: UITableViewCell) {
        (cell as? CellType)?.configure(model: item)
    }
}
