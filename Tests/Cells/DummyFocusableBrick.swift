//
//  DummyFocusableBrick.swift
//  BrickApp
//
//  Created by Justin Anderson on 10/17/16.
//  Copyright © 2016 Wayfair. All rights reserved.
//

@testable import BrickKit

class DummyFocusableBrick: Brick {
    var border: CGFloat = 1

}

class DummyFocusableBrickCell: BrickCell, Bricklike {
    typealias BrickType = DummyFocusableBrick

    var isCurrentlyFocused = false
    var shouldLoseFocus = true
    var shouldTakeFocus = true

    override func updateContent() {
        super.updateContent()

        self.contentView.layer.borderWidth = brick.border
    }
}

extension DummyFocusableBrickCell: FocusableBrickCell {
    
    func willFocus() -> Bool {
        if !shouldTakeFocus {
            return false
        }
        
        isCurrentlyFocused = true
        return true
    }
    
    func willUnfocus() -> Bool {
        if !shouldLoseFocus {
            return false
        }
        
        isCurrentlyFocused = false
        return true
    }
}
