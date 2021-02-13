//
//  ChessStepCounter.swift
//  Otus_algo
//
//  Created by Alexander Kraev on 13.02.2021.
//

import Foundation

final class ChessStepCounter: Task {
    
    private var figure: figureType
    init(_ figure: figureType) {
        self.figure = figure
    }
    
    enum figureType {
        case king //король
        case knight //конь
        case rook //ладья
        case bishop //слон
        case queen //ферзь
    }
    
    func run(_ data: [String]) -> (String, String) {
        let position = (data[0] as NSString).integerValue
        var steps: UInt64
        var stepsCount: Int
        switch figure {
        case .king:
            (stepsCount, steps) = countForKing(position)
        case .knight:
            (stepsCount, steps) = countForKnight(position)
        case .rook:
            (stepsCount, steps) = countForRook(position)
        case .bishop:
            (stepsCount, steps) = countForBishop(position)
        case .queen:
            (stepsCount, steps) = countForQueen(position)
        }
        return (String("\(stepsCount)"), String("\(steps)") )
    }
    
    //Для короля
    func countForKing(_ position: Int) -> (Int, UInt64) {
        let K: UInt64 = 1 << position
        let noA: UInt64 = 0xFEFEFEFEFEFEFEFE
        let noH: UInt64 = 0x7F7F7F7F7F7F7F7F
        let Ka: UInt64 = noA & K
        let Kh: UInt64 = noH & K
        let steps: UInt64 =
                    (Ka << 7) | (K << 8) | (Kh << 9) |
                    (Ka >> 1) |            (Kh << 1) |
                    (Ka >> 9) | (K >> 8) | (Kh >> 7)
        
        let numOfSteps = countForNumOfSteps(steps)
        return (numOfSteps, steps)
    }
    
    //Для коня
    func countForKnight(_ position: Int) -> (Int, UInt64) {
        let K: UInt64 = 1 << position
        let noA: UInt64 = 0xFEFEFEFEFEFEFEFE
        let noAB: UInt64 = 0xfcfcfcfcfcfcfcfc
        let noGH: UInt64 = 0x3f3f3f3f3f3f3f3f
        let noH: UInt64 = 0x7F7F7F7F7F7F7F7F
        let Ka: UInt64 = noA & K
        let Kab: UInt64 = noAB & K
        let Kgh: UInt64 = noGH & K
        let Kh: UInt64 = noH & K

        let steps: UInt64 =
                    (Ka << 15) | (Kh << 17) |
        (Kab << 6 ) |                        (Kgh << 10) |
        (Kab >> 10) |                        (Kgh >> 6 ) |
                    (Kh >> 15)  | (Ka >> 17)

        
        let numOfSteps = countForNumOfSteps(steps)
        return (numOfSteps, steps)
    }
    
    //Для ладьи
    func countForRook(_ position: Int) -> (Int, UInt64) {
        let K: UInt64 = 1 << position
        
        let upperVertSteps: UInt64 = (K << 56) |
                                     (K << 48) |
                                     (K << 40) |
                                     (K << 32) |
                                     (K << 24) |
                                     (K << 16) |
                                     (K << 8)
            
        let downVertSteps: UInt64 =  (K >> 8)  |
                                     (K >> 16) |
                                     (K >> 24) |
                                     (K >> 32) |
                                     (K >> 40) |
                                     (K >> 48) |
                                     (K >> 56)
        
        let onlyA: UInt64  = 0x101010101010101
        let K_only_a = onlyA & K
        
        let onlyAB: UInt64 = 0x303030303030303
        let K_only_ab = onlyAB & K
        
        let onlyABC: UInt64 = 0x707070707070707
        let K_only_abc = onlyABC & K
        
        let onlyABCD: UInt64 = 0xf0f0f0f0f0f0f0f
        let K_only_abcd = onlyABCD & K
        
        let onlyABCDE: UInt64 = 0x1f1f1f1f1f1f1f1f
        let K_only_abcde = onlyABCDE & K

        let onlyABCDEF: UInt64 = 0x3f3f3f3f3f3f3f3f
        let K_only_abcdef = onlyABCDEF & K
        
        let onlyABCDEFG: UInt64 = 0x7f7f7f7f7f7f7f7f
        let K_only_abcdefg = onlyABCDEFG & K
        
        let rightHorizSteps: UInt64 = (K_only_abcdefg << 1) | (K_only_abcdef << 2) | (K_only_abcde << 3) | (K_only_abcd << 4) | (K_only_abc << 5) | (K_only_ab << 6) | (K_only_a << 7)
        
        let onlyH: UInt64  = 0x8080808080808080
        let K_only_h = onlyH & K
        
        let onlyGH: UInt64 = 0xc0c0c0c0c0c0c0c0
        let K_only_gh = onlyGH & K
        
        let onlyFGH: UInt64 = 0xe0e0e0e0e0e0e0e0
        let K_only_fgh = onlyFGH & K
        
        let onlyEFGH: UInt64 = 0xf0f0f0f0f0f0f0f0
        let K_only_efgh = onlyEFGH & K
        
        let onlyDEFGH: UInt64 = 0xf8f8f8f8f8f8f8f8
        let K_only_defgh = onlyDEFGH & K

        let onlyCDEFGH: UInt64 = 0xfcfcfcfcfcfcfcfc
        let K_only_cdefgh = onlyCDEFGH & K
        
        let onlyBCDEFGH: UInt64 = 0xfefefefefefefefe
        let K_only_bcdefgh = onlyBCDEFGH & K
        
        let leftHorizSteps: UInt64 = (K_only_bcdefgh >> 1) | (K_only_cdefgh >> 2) | (K_only_defgh >> 3) | (K_only_efgh >> 4) | (K_only_fgh >> 5) | (K_only_gh >> 6) | (K_only_h >> 7)
        let steps = upperVertSteps | downVertSteps | leftHorizSteps | rightHorizSteps
        
        let numOfSteps = countForNumOfSteps(steps)
        return (numOfSteps, steps)
    }
    
    //Для слона
    func countForBishop(_ position: Int) -> (Int, UInt64) {
        let K: UInt64 = 1 << position
        
        let onlyH: UInt64  = 0x8080808080808080
        let K_only_h = onlyH & K
        
        let onlyGH: UInt64  = 0xc0c0c0c0c0c0c0c0
        let K_only_gh = onlyGH & K
        
        let onlyFGH: UInt64  = 0xe0e0e0e0e0e0e0e0
        let K_only_fgh = onlyFGH & K
        
        let onlyEFGH: UInt64  = 0xf0f0f0f0f0f0f0f0
        let K_only_efgh = onlyEFGH & K
        
        let onlyDEFGH: UInt64  = 0xf8f8f8f8f8f8f8f8
        let K_only_defgh = onlyDEFGH & K
        
        let onlyCDEFGH: UInt64  = 0xfcfcfcfcfcfcfcfc
        let K_only_cdefgh = onlyCDEFGH & K
        
        let onlyBCDEFGH: UInt64  = 0xfefefefefefefefe
        let K_only_bcdefgh = onlyBCDEFGH & K
        
        let upperLeftDiagSteps: UInt64 =
                                        (K_only_h << 49) |
                                        (K_only_gh << 42) |
                                        (K_only_fgh << 35) |
                                        (K_only_efgh << 28) |
                                        (K_only_defgh << 21) |
                                        (K_only_cdefgh << 14) |
                                        (K_only_bcdefgh << 7)
        
        
        let onlyA: UInt64  = 0x101010101010101
        let K_only_a = onlyA & K
        
        let onlyAB: UInt64 = 0x303030303030303
        let K_only_ab = onlyAB & K
        
        let onlyABC: UInt64 = 0x707070707070707
        let K_only_abc = onlyABC & K
        
        let onlyABCD: UInt64 = 0xf0f0f0f0f0f0f0f
        let K_only_abcd = onlyABCD & K
        
        let onlyABCDE: UInt64 = 0x1f1f1f1f1f1f1f1f
        let K_only_abcde = onlyABCDE & K

        let onlyABCDEF: UInt64 = 0x3f3f3f3f3f3f3f3f
        let K_only_abcdef = onlyABCDEF & K
        
        let onlyABCDEFG: UInt64 = 0x7f7f7f7f7f7f7f7f
        let K_only_abcdefg = onlyABCDEFG & K
        
        let upperRightDiagSteps: UInt64 =
                                            (K_only_a << 63) |
                                            (K_only_ab << 54) |
                                            (K_only_abc << 45) |
                                            (K_only_abcd << 36) |
                                            (K_only_abcde << 27) |
                                            (K_only_abcdef << 18) |
                                            (K_only_abcdefg << 9)
        
        let downRightDiagSteps: UInt64 =
                                            (K_only_abcdefg >> 7) |
                                            (K_only_abcdef >> 14) |
                                            (K_only_abcde >> 21) |
                                            (K_only_abcd >> 28) |
                                            (K_only_abc >> 35) |
                                            (K_only_ab >> 42) |
                                            (K_only_a >> 49)

        let downLeftDiagSteps: UInt64 =
                                            (K_only_bcdefgh >> 9) |
                                            (K_only_cdefgh >> 18) |
                                            (K_only_defgh >> 27) |
                                            (K_only_efgh >> 36) |
                                            (K_only_fgh >> 45) |
                                            (K_only_gh >> 54) |
                                            (K_only_h >> 63)
        
        let steps: UInt64 = upperLeftDiagSteps | upperRightDiagSteps | downRightDiagSteps | downLeftDiagSteps
        
        let numOfSteps = countForNumOfSteps(steps)
        return (numOfSteps, steps)
    }
    
    //Для ферзя
    //самый простой случай, так как
    //будет аналогичен подсчету ладьи вместе со слоном
    func countForQueen(_ position: Int) -> (Int, UInt64) {
    
        
        //считаем как для ладьи:
        let (stepsCountAsRook, stepsAsRook): (Int, UInt64) = countForRook(position)

        //считаем как для слона:
        let (stepsCountAsBishop, stepsAsBishop): (Int, UInt64) = countForBishop(position)
        
        //итог:
        let steps: UInt64 = stepsAsRook | stepsAsBishop
        
        let numOfSteps = stepsCountAsRook + stepsCountAsBishop
        return (numOfSteps, steps)
    }
    
    //считаем число степеней двойки
    //это и будет абсолютное число всех ходов
    func countForNumOfSteps(_ steps: UInt64) -> Int{
        var stepsVar = steps
        var counter: Int = 0
        while(true){
            ///чтобы сделать первоначальное присваивание:
            if (stepsVar & 1 == 1) { counter += 1 }
            ///сдвигаем на разряд двойки вправо
            stepsVar = stepsVar >> 1
           
            ///если сдвиг уже равен 0, то выходим из цикла
            if (stepsVar == 0) { break }
        }
         return counter
    }
    
}
