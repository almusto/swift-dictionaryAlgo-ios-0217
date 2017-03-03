//: Playground - noun: a place where people can play

import UIKit


//TIME HANDLE


func getHandAngles(withTime time: String) -> CGFloat {
    let components = time.characters.split { $0 == ":" } .map { (x) -> Int in return Int(String(x))! }
    let hour = CGFloat(components[0])
    let minutes = CGFloat(components[1])
    let convertedHour: CGFloat
    if hour == 12 {
      convertedHour = 0
    } else if hour > 12 {
      convertedHour = hour - 12
    } else {
      convertedHour = hour
    }
    let mHdegrees = minutes * 6
    let hhandDegrees = (convertedHour + (minutes/60)) * 30
    let ans = abs(mHdegrees - hhandDegrees)
    if ans > 180 {
      return ans - 180
    } else {
      return ans
    }
}

getHandAngles(withTime: "1:04")



//MARK DIctionary:



enum DictionaryError: Error {
  case noKeyExists
  case noValueExists
}


struct TheRealDictionary: Equatable {


  var dictArray: [(key: String, value: String)] = []

  init(keyValue: (String, String)) {
    dictArray.append(keyValue)
  }

  static func == (lhs: TheRealDictionary, rhs: TheRealDictionary) -> Bool {
    return lhs == rhs
  }


  mutating func add(key: String, withValue value: String) {
        for i in 0..<dictArray.count {
          if dictArray[i].0 == key {
            dictArray.remove(at: i)
            dictArray.append((key, value))
          } else {
            dictArray.append((key, value))
          }
    }
  }

   mutating func updateValue(value: String, forKey key: String) {
    for i in 0..<dictArray.count {
      if dictArray[i].0 == key {
        dictArray.remove(at: i)
        dictArray.append((key, value))
      } else {
        return "no such key exsits"
      }
    }

  }

  func getValue(forKey key: String) -> String {
    var value: String = ""
    for (keyy, valuee) in dictArray {
      if keyy == key {
        value = valuee
      }
    }
    if value == "" {
      return "no such key exsits"
    } else {
      return value
    }

  }

  func getKeys(forValue value: String)  -> [String] {
    var keys: [String] = []
    for (keyy, valuee) in dictArray {
      if valuee == value {
        keys.append(keyy)
      }
    }
    if keys.isEmpty {
      print("no such value exsits")
      return []
    } else {
      return keys
    }

  }

  func count() -> Int {
    return dictArray.count
  }

  mutating func removeAll() {
    dictArray.removeAll()

  }

  func getAllKeys() -> [String] {
    var allKeys: [String] = []
    for (keyy, _) in dictArray {
      allKeys.append(keyy)
    }
    return allKeys

  }

  func getAllValues() -> [String] {
    var allValues: [String] = []
    for(_, valuee) in dictArray {
      allValues.append(valuee)
    }
    return allValues
  }


}




var dict = TheRealDictionary(keyValue: ("test", "pest"))
























