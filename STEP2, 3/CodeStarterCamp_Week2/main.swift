//
//  main.swift
//  CodeStarterCamp_Week2
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

func generateLotto() -> Array<Int> {
    var lottoNumberSet = Set<Int>()
    
    while lottoNumberSet.count < 6 {
        let randomLottoNum: Int = Int.random(in: 1...45)

        lottoNumberSet.insert(randomLottoNum)
    }
    return Array(lottoNumberSet)
}


func matchLotto(with lotto: () -> Array<Int>) -> (notice: String, winningLottoNumberList: [Int]) {
    let lottoNumbers = lotto()
    let myLottoNumbers: [Int] = [1,2,3,4,5,6]
    let winningLottoNumArray: Array<Int> = myLottoNumbers.filter { lottoNumbers.contains($0) }
    let winningLottoNumList: String = winningLottoNumArray.map { String($0) }.joined(separator: ", ")
    var notice: String = ""
    
    if winningLottoNumArray.isEmpty {
        notice = "아쉽지만 겹치는 번호가 없습니다."
    } else {
        notice = "축하합니다! 겹치는 번호는 \(winningLottoNumList) 입니다!"
    }
    return (notice, lottoNumbers)
}


func saveAndCheckLottoNumByRound(lottoRound: Int, checkRound: String) {
    var winningLottoDictByRound = [String: Array<Int>]()
    
    for round in 1...lottoRound {
        let function = matchLotto(with: generateLotto)
        winningLottoDictByRound["\(round)회차"] = function.winningLottoNumberList
    }
    
    if let winningLottoNum = winningLottoDictByRound[checkRound] {
        let winningLottoNumList = winningLottoNum.map { String($0) }.joined(separator: ", ")
        print("\(checkRound)의 로또 당첨 번호는 \( winningLottoNumList) 입니다.")
    } else { return }
}


// MARK: - 함수 실행부
saveAndCheckLottoNumByRound(lottoRound: 5, checkRound: "2회차")
