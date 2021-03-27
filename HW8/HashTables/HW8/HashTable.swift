//
//  HashTable.swift
//  HashTables
//
//  Created by Alexander Kraev on 27.03.2021.
//

import Foundation

//Класс Хэш таблицы вставки элемента типа Value с ключом Key
class HashTable<Key, Value>: CustomStringConvertible where Key: Hashable {
    
    // рубеж, после прохождения которого, нужно делать увеличение мощности хэш-таблицы,
    // то есть вызывать рехэширование rehash()
    // вычисляется один раз после каждого увеличения мощности хэш-таблицы
    // по принципу округления:  Int( ТЕКУЩАЯ_МОЩНОСТЬ_ТАБЛИЦЫ * loadFactor )
    private var threshold: Int
    
    // load factor for this hash table
    // используется для вычисления рубежа threshold
    // иначе говоря уровень загруженности хэш-таблицы
    // по-умолч. в конструкторе это 75%
    private let loadFactor: Float
    
    // переменная для хранения заполненности таблицы - числа корзин
    // current number of buckets
    public var size: Int = 0
    
    public func capacity() -> Int {
        buckets.count
    }
    // внтренний класс для связного списка - корзин - ячеек таблицы
    private class Node : CustomStringConvertible {
        
        var element: (key: Key,value: Value)?
        var next: Node? // указатель на следующий элемент в списке
        
        init(key: Key,value: Value){
            self.element = (key, value)
        }
        
        var description: String {
            var str = ""
            if let e = element {
                str += "(Key: \(String(describing: e.key)), value: \(String(describing: e.value)))\n"
            }
            if let next = self.next {
                str += next.description
            }
            return str
        }
    }
    
    private var buckets: Array<Node?>
    
    // capacity - изначальная мощность
    public init(capacity: Int = 11, factor: Float = 0.75){
        loadFactor = factor
        threshold = Int(Float(capacity) * factor)
        buckets = Array<Node?>(repeatElement(nil, count: capacity))
    }
    
    public func isEmpty() -> Bool {
        size == 0
    }
    
    func put(key: Key, value: Value) {
        // сначала считаем hash:
        var idx = hash(key)
        // получаем корзину по индексу:
        var e = buckets[idx]
        
        // сначала ищем, есть ли уже указанный ключ
        // если да, то перезапишем новым значением
        while (e != nil)
        {
            if (e?.element?.key == key) {
                // если нашли ключ, то перезаписываем его значением:
                e?.element?.value = value
                return
            }
            e = e?.next
        }
        
        // на этом шаге мы знаем, что корзин с ключом нет,
        // поэтому добавим ее
        
        //увеличиваем размер таблицы:
        size += 1
        
        // и смотрим не вышли ли мы за пределы рубежа,
        // иначе делаем рехэширование:
        if (size > threshold) {
            rehash()
            idx = hash(key)
        }
        
        // создаем новую корзину для данного ключа
        e = .init(key: key, value: value)
        // помещаем элемент
        e?.next = buckets[idx]
//        e?.element = (key, value)
        // добавляем корзину в таблицу
        buckets[idx] = e
    }
    
    // получение значения по ключу:
    @discardableResult
    func get(key: Key) -> Value? {
        // сначала считаем hash:
        let idx = hash(key)
        // получаем корзину по индексу:
        var e = buckets[idx]
        
        while (e != nil)
        {
            if (e?.element?.key == key) {
                return e?.element?.value
            }
            e = e?.next
        }
        return nil
    }
    
    @discardableResult
    func del(key: Key) -> Value? {
        // сначала считаем hash:
        let idx = hash(key)
        // получаем корзину по индексу:
        var e = buckets[idx]
        var last: Node?
        
        while (e != nil)
        {
            if (e?.element?.key == key) {
                if (last == nil) {
                    // просто меняем указатель на первый элемент в корзине:
                    buckets[idx] = e?.next
                } else {
                    last?.next = e?.next
                }
                size -= 1
                return e?.element?.value
            }
            last = e
            e = e?.next
        }
        return nil
    }
    
    /**
     Increases the size of the Hashtable and rehashes all keys to new array
     indices; this is called when the addition of a new value would cause
     size() > threshold. Note that the existing Entry objects are reused in
      the new hash table.
     
     This is not specified, but the new size is twice the current size plus
     one; this number is not always prime, unfortunately.
     */
    
    private func rehash() {
        // для начала сохраним прошлые корзины
        let oldBuckets = buckets
        
        //вычисляем размер новой таблицы
        let newCapacity = (buckets.count * 2) + 1
        // не забываем про новый рубеж, когда нужно будет выполнить rehash():
        threshold = Int(Float(newCapacity) * loadFactor)
        
        // создаем новые корзины
        buckets = Array<Node?>(repeatElement(nil, count: newCapacity))
        
        for i in 0...oldBuckets.count - 1 {
            var e = oldBuckets[i]
            while e != nil {
                guard let key = e?.element?.key else { continue }
                let idx = hash(key)
                var dest = buckets[idx]
                if (dest != nil) {
                    var next = dest?.next
                    while next != nil {
                        dest = next
                        next = dest?.next
                    }
                    dest?.next = e
                } else {
                    buckets[idx] = e
                }
                
                let next = e?.next
                e?.next = nil
                e = next
            }
        }
    }

    func hash(_ key: Key) -> Int {
        let hash = key.hashValue % buckets.count
        return hash < 0 ? -hash : hash
    }
    
    var description: String {
        var str = ""
        
        buckets.enumerated().forEach { index, bucket in
            str += "bucket \(index):\n"
            str += bucket?.description ?? "empty"
            str += "\n"
        }

        return str
    }
}
