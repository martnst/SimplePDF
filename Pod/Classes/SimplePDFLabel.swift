//
//  PDFLabel.swift
//
//  Created by Muhammad Ishaq on 22/03/2015.
//

import UIKit

class SimplePDFLabel: UILabel {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override func draw(_ layer: CALayer?, in ctx: CGContext?) {
        guard let ctx = ctx, let layer = layer else {
            return
        }
        
        let isPDF = !UIGraphicsGetPDFContextBounds().isEmpty
        
        if(!layer.shouldRasterize && isPDF && (self.backgroundColor == nil || (self.backgroundColor?.cgColor)?.alpha == 0)) {
            self.draw(self.bounds)
        }
        else {
            super.draw(layer, in: ctx)
        }
    }

}
