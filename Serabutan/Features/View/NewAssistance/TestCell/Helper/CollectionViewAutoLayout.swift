//
//  CollectionViewAutoLayout.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 03/08/21.
//

import Foundation
import UIKit

public protocol CollectionCellAutoLayout: class {
    var cachedSize: CGSize? { get set }
}
