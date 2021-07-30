//
//  QueensSolver.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-13.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

/// Write a function solveQueens that accepts a Board as a parameter
/// and tries to place 8 queens on it safely.
///
/// - Your method should stop exploring if it finds a solution
/// - You are allowed to change the function header (args or return type)
/// - Your total recursive calls should not exceed 120 times.

var total = 0;
var numOfCase = 0;

enum Type: String {
    case all
    case first
}

func solve8Queens(board: inout Board, type: Type) {
    total = 0
    numOfCase = 0
    switch type {
    case .all:
        doSolve8QueensAll(board: &board, numQueen: 8, row: 0)
    case .first:
        let result = doSolve8QueensFirst(board: &board, numQueen: 8, row: 0)
        print(result)
    }
}

func doSolve8QueensAll(board: inout Board, numQueen: Int, row: Int) {
    total+=1;
    
    // base case
    if(numQueen <= 0) {
        numOfCase+=1
        return print(board.description)
    }
    if(row > board.size - 1) { return }
    
    // recursive case
    for thisCol in 0...(board.size - 1) {
        if board.isSafe(row: row, col: thisCol) {
            board.place(row: row, col: thisCol)
            doSolve8QueensAll(board: &board, numQueen: numQueen - 1, row: row + 1) // go to next row
            board.remove(row: row, col: thisCol)
        }
    }
}


func doSolve8QueensFirst(board: inout Board, numQueen: Int, row: Int) -> String {
    total+=1;
    
    // base case
    if(numQueen <= 0) {
        numOfCase+=1
        return board.description;
    }
    if(row > board.size - 1) { return "" }
    
    // recursive case
    for thisCol in 0...(board.size - 1) {
        if board.isSafe(row: row, col: thisCol) {
            board.place(row: row, col: thisCol)
            let result = doSolve8QueensFirst(board: &board, numQueen: numQueen - 1, row: row + 1) // go to next row
            if result != "" { return result }
            board.remove(row: row, col: thisCol)
        }
    }
    return ""
}
