//
//  main.swift
//  queens
//
//  Created by shunnamiki on 2021/07/30.
//

import Foundation

func solve8Queens(board: inout Board) {
    doSolve8Queens(board: &board, numQueen: 8, row: 0)
}

//func suffix(_ num: Int) -> String {
//    var suf = "";
//    for _ in 0...num {
//        suf += "-"
//    }
//    return suf
//}

func doSolve8Queens(board: inout Board, numQueen: Int, row: Int) {
    total+=1;
    
    // logging
//    print(suffix(8 - numQueen), "row:", row, "col:", col, "numQueen:", numQueen)

    // base case
    if(numQueen <= 0) {
        numOfPossibility+=1
        return print(board.description)
    }
    if(row > board.size - 1) { return }
    
    // recursive case
    for thisCol in 0...(board.size - 1) {
        if board.isSafe(row: row, col: thisCol) {
            board.place(row: row, col: thisCol)
            doSolve8Queens(board: &board, numQueen: numQueen - 1, row: row + 1) // go to next row
            board.remove(row: row, col: thisCol)
        }
    }
}

var total = 0;
var numOfPossibility = 0;

// ----------------
var board = Board.init(size: 8)
solve8Queens(board: &board)
print("total: ", total, "numOfPossibility: ", numOfPossibility)
