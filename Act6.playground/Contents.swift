import UIKit


class LN {
    var value : Int = 0
    var next : LN?
    var prev : LN?
}

class LRUCache {
    var dictonary: [Int:LN] = [:]
    let head = LN()
    let tail = LN()
    
    func put (value: Int){
        if let obj = dictonary[value] {
            let  prev = obj.prev
            let  next = obj.next
            prev?.next = next
            next?.prev = prev
            head.next = obj
            
        } else {
            if(dictonary.isEmpty){
                let obj = LN()
                obj.value = value
                head.next = obj
                tail.prev = obj
                dictonary[value] = obj
            }else{
                let obj = LN()
                obj.next = head.next
                obj.value = value
                head.next = obj
                dictonary[value] = obj
            }
        }
    }
    func get() -> Int {
        if(dictonary.isEmpty){
            return 0
        }else {
            let obj = head.next
            let  prev = obj?.prev
            let  next = obj?.next
            prev?.next = next
            next?.prev = prev
            head.next = obj
            return (obj?.value)!
        }
        
        
    }
}

var var_lru = LRUCache()

var_lru.put(value: 1)
var_lru.put(value: 2)
var_lru.put(value: 3)

var_lru.get()

var_lru.get()

var_lru.put(value: 1)
var_lru.put(value: 2)


var_lru.get()




