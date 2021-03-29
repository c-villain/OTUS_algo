//
//  OpenAddressing.swift
//  HashTables
//
//  Created by Alexander Kraev on 29.03.2021.
//

import Foundation

// Реализация Хэш-таблицы методом открытой адресации
// Open addressing

class OpenAddressingHashTable<Key, Value>: CustomStringConvertible where Key: Hashable {
    
    // рубеж
    private var threshold: Int
    
    // загруженность, по умолч. 75%
    private let loadFactor: Float

    // загруженность таблицы, то есть количество непустых ячеек
    public var size: Int = 0
    
    // размер таблицы, то есть высота таблицы (с пустыми и не пустыми ячейками)
    public func capacity() -> Int {
        buckets.count
    }
    
    // внутренний класс для хранимой ноды
    private class Node : CustomStringConvertible {
        
        var key: Key
        var value: Value
        var isDeleted: Bool
        
        init(key: Key, value: Value){
            self.key = key
            self.value = value
            self.isDeleted = false
        }
        
        var description: String {
            self.isDeleted ? "empty" : "(Key: \(String(describing: self.key)), value: \(String(describing: self.value)))\n"
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
    
    func hash(_ key: Key) -> Int {
        //TODO: изменить подсчет хэша через формулу!
        let hash = key.hashValue % buckets.count
        return hash < 0 ? -hash : hash
    }
    
    func put(key: Key, value: Value) {
        
        /*
        // сначала считаем hash:
        var idx = hash(key)
        
        // переменная для хранения курсора - указателя на текущую непустую ячейку в таблице
        // курсор нужен для того, чтобы понимать на какое место ставить очередное ячейку
        // иначе говоря номер попытки
        var cursor = idx
        // получаем начальную ячейку по индексу:
        var e = buckets[idx]

        // сначала ищем, есть ли уже указанный ключ
        // если да, то перезапишем новым значением
        
        while (e != nil)
        {
            // если нашли нужный ключ, то перезапишем новым значением
            if (e?.key == key) {
                e?.value = value
            }
            //иначе ищем дальше, то есть "идем по стрелке"
            
            // если индекс из середины, то увеличиваем на 1, иначе идём в начало таблицы
            if (cursor + 1 <= capacity() - 1) {
                cursor += 1
            } else {
                cursor = 0
            }
            
            // если мы сделали полный оборот, то ничего не нашли
            if (cursor == idx) { break }
            
            // иначе смотрим на очередную ячейку
            e = buckets[cursor]
        }
        */
        
        // сначала ищем, есть ли уже указанный ключ
        // если да, то перезапишем новым значением
        var e = self.getNode(key: key)
        
        if e.node != nil {
            e.node?.value = value
            return
        }
        // на этом шаге мы знаем, что ячейки с таким ключом нет,
        // поэтому добавим ее
        
        //увеличиваем размер таблицы:
        size += 1
        
        // и смотрим не вышли ли мы за пределы рубежа,
        // иначе делаем рехэширование:
        if (size > threshold) {
            rehash()
            e.cursor = hash(key)
        }
        
        // создаем новую ячейку для данного ключа
        let cell: Node = .init(key: key, value: value)
        
        // добавляем ячейку в первую пустую ячейку таблицы
        // мы ее получили на этапе поиска элемента
        // индекс, куда кладем, хранится в курсоре - первой пустой ячейке
        
        /// если какой-то мега-плохой случай:
        /// и через хэш не нашли, и в таблице пустых нет
        /// то вообще не понятно, куда ячейку помещать:
        /// здесь надо кидать ошибку, в теории такого случая вообще быть не может
        /// но я опишу его здесь
        guard let cursur = e.cursor else { return }
        buckets[cursur] = cell
    }
    
    // получение значения по ключу:
    @discardableResult
    func get(key: Key) -> Value? {
        self.getNode(key: key).node?.value
    }
    
    @discardableResult
    // курсор указывает
    // 1. или на номер ячейки, где ключ найден, чтобы его перезаписать, например
    // 2. или на первый nil ячейку в таблице
    private func getNode(key: Key) -> (node: Node?, cursor: Int?) {
        // сначала считаем hash:
        let idx = hash(key)
        
        // переменная для хранения курсора - указателя на текущую ячейку в таблице
        // нужна чтобы не сделать полный оборот в таблице, в теории такой ситуации быть не может
        // из-за рехэширования, но мы учтем этот случай, ибо так работают профессионалы =)
        var cursor = idx
        // получаем начальную ячейку по индексу:
        var e = buckets[idx]

        while (e != nil)
        {
            // если нашли нужный ключ, то возращаем значение
            if (e?.key == key) {
                return (e, cursor)
            }
            //иначе идем по стрелке
            
            // если индекс из середины, то увеличиваем на 1, иначе идём в начало таблицы
            if (cursor + 1 <= capacity() - 1) {
                cursor += 1
            } else {
                cursor = 0
            }
            
            //если мы сделали полный оборот, то ничего не нашли
            if (cursor == idx) { return (nil, nil) }
            
            // иначе смотрим на очередную ячейку
            e = buckets[cursor]
        }
        return (nil, nil)
    }
    
    @discardableResult
    func del(key: Key) -> Value? {
        /*
        // сначала считаем hash:
        let idx = hash(key)
        
        // переменная для хранения курсора - указателя на текущую ячейку в таблице
        // нужна чтобы не сделать полный оборот в таблице, в теории такой ситуации быть не может
        // из-за рехэширования, но мы учтем этот случай, ибо так работают профессионалы =)
        var cursor = idx
        // получаем начальную ячейку по индексу:
        var e = buckets[idx]

        while (e != nil)
        {
            // если нашли нужный ключ, то возращаем значение
            if (e?.key == key) {
                size -= 1
                //помечаем удаленным, но естественно само значение не удаляем
                // чтобы корректно работала "стрелка"
                e?.isDeleted = true
                return e?.value
            }
            //иначе идем по стрелке
            
            // если индекс из середины, то увеличиваем на 1, иначе идём в начало таблицы
            if (cursor + 1 <= capacity() - 1) {
                cursor += 1
            } else {
                cursor = 0
            }
            
            //если мы сделали полный оборот, то ничего не нашли
            if (cursor == idx) { return nil }
            
            // иначе смотрим на очередную ячейку
            e = buckets[cursor]
        }
        return nil
 */
        guard let node = self.getNode(key: key).node else { return nil } //не нашли такой ноды
        node.isDeleted = true
        size -= 1
        return node.value
    }
    
    //TODO!
    private func rehash() {
//        // для начала сохраним прошлые корзины
//        let oldBuckets = buckets
//        
//        //вычисляем размер новой таблицы
//        let newCapacity = (buckets.count * 2) + 1
//        // не забываем про новый рубеж, когда нужно будет выполнить rehash():
//        threshold = Int(Float(newCapacity) * loadFactor)
//        
//        // создаем новые корзины
//        buckets = Array<Node?>(repeatElement(nil, count: newCapacity))
//        
//        for i in 0...oldBuckets.count - 1 {
//            var e = oldBuckets[i]
//            while e != nil {
//                guard let key = e?.element?.key else { continue }
//                let idx = hash(key)
//                var dest = buckets[idx]
//                if (dest != nil) {
//                    var next = dest?.next
//                    while next != nil {
//                        dest = next
//                        next = dest?.next
//                    }
//                    dest?.next = e
//                } else {
//                    buckets[idx] = e
//                }
//                
//                let next = e?.next
//                e?.next = nil
//                e = next
//            }
//        }
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
