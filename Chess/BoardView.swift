//
//  BoardView.swift
//  Chess
//
//  Created by Hetang Mehta on 2023-01-13.
//

import UIKit

class BoardView: UIView {
    
    let ratio: CGFloat = 0.8
    var originX: CGFloat = -10
    var originY: CGFloat = -10
    var cellSide: CGFloat = -10

    var shadowPieces: Set<ChessPiece> = Set<ChessPiece>()
    
    override func draw(_ react: CGRect){
        cellSide = bounds.width * ratio / 8
        originX = bounds.width * (1 - ratio) / 2
        originY = bounds.width * (1 - ratio) / 2
        
        drawBoard()
        drawPieces()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location(in: self)
        print(fingerLocation)
    }
    
    func drawPieces(){
        for piece in shadowPieces {
            let pieceImage = UIImage(named: piece.imageName)
            pieceImage?.draw(in: CGRect(x: originX + CGFloat(piece.col) * cellSide, y: originY + CGFloat(piece.row) * cellSide, width: cellSide, height: cellSide))
        }
    }
    
    func drawBoard(){
        for row in 0..<4{
            for col in 0..<4{
                drawSquare(col: col*2, row: row*2, color: UIColor.white)
                drawSquare(col: 1+col*2, row: row*2, color: UIColor.gray)
                drawSquare(col: col*2, row: 1+row*2, color: UIColor.gray)
                drawSquare(col: 1+col*2, row: 1+row*2, color: UIColor.white)
            }
        }
    }
    
    func drawSquare(col: Int, row: Int, color: UIColor){
        let path = UIBezierPath(rect: CGRect(x: originX + CGFloat(col) * cellSide, y: originY + CGFloat(row) * cellSide, width: cellSide, height: cellSide))
        color.setFill()
        path.fill()
    }
    
}