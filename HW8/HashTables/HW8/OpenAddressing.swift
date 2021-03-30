//
//  OpenAddressing.swift
//  HashTables
//
//  Created by Alexander Kraev on 29.03.2021.
//

import Foundation

// Реализация Хэш-таблицы методом открытой адресации
// Open addressing
// Реализовать вариант линейного, квадратичного и двойного пробинга
class OpenAddressingHashTable<Key, Value>: CustomStringConvertible where Key: Hashable {
    
    enum AddressingType : Equatable {
        case linear(Int) //линейный
        case quadratic(Int, Int) //квадратичный, c1 и c2 значения
        case double //двойной
    }
    
    private let type: AddressingType
    
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
    public init(type: AddressingType = .linear(0), capacity: Int = 11, factor: Float = 0.75){
        loadFactor = factor
        threshold = Int(Float(capacity) * factor)
        buckets = Array<Node?>(repeatElement(nil, count: capacity))
        self.type = type
    }
    
    public func isEmpty() -> Bool {
        size == 0
    }
    
    /// i - номер попытки
    func hash(_ key: Key, i: Int) -> Int {
        var hash: Int
        switch type {
        case .linear(let a):
            hash = key.hashValue + i * a
        case .quadratic(let a, let b):
            hash = key.hashValue + a * i + b * Int(pow(Double(i), 2))
        case .double:
            hash = key.hashValue + i * key.hashValue
        }
        hash %= buckets.count
        return hash < 0 ? -hash : hash
    }
    
    /// вырожденный случай линейной адресации с a = 0
    func hashInLinear(_ key: Key) -> Int {
        let hash = key.hashValue % buckets.count
        return hash < 0 ? -hash : hash
    }
    
    func put(key: Key, value: Value) {
        // сначала ищем, есть ли уже указанный ключ
        // если да, то перезапишем новым значением
        var e = self.getNode(key: key)
        
        if e.node != nil {
            e.node?.value = value
            return
        }
        // на этом шаге мы знаем, что ячейки с таким ключом нет,
        // поэтому добавим ее
        
        // сначала смотрим не выходим ли мы за пределы рубежа,
        // иначе делаем рехэширование:
        if (size + 1 > threshold) {
            rehash()
            e = self.getNode(key: key)
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
        
        //увеличиваем размер таблицы после добавления
        size += 1
    }
    
    // получение значения по ключу:
    @discardableResult
    func get(key: Key) -> Value? {
        self.getNode(key: key).node?.value
    }

    @discardableResult
    /// Вырожденный случай поиска ячейки в таблице при линейной адресации с a = 0
    /// то есть когда мы смотрим на ячейки подряд
    /// курсор указывает
    /// 1. или на номер ячейки, где ключ найден, чтобы его перезаписать, например
    /// 2. или на первый nil ячейку в таблице
    /// 3. или на первую лениво удаленную ячейку
    private func getNodeInLinear(key: Key) -> (node: Node?, cursor: Int?) {
        // сначала считаем hash:
        let idx = hashInLinear(key)
        
        // переменная для хранения курсора - указателя на текущую ячейку в таблице
        // нужна чтобы не сделать полный оборот в таблице, в теории такой ситуации быть не может
        // из-за рехэширования, но мы учтем этот случай, ибо так работают профессионалы =)
        var cursor = idx
        
        // переменная для хранения индекса лениво удаленного элемента:
        var delCursor: Int?
        // получаем начальную ячейку по индексу:
        var e = buckets[idx]

        while (e != nil)
        {
            if let cell = e, cell.isDeleted {
                // если при проходе замечаем удаленную ссылку, то сохраняем ее,
                // чтоб потом сделать оптимизацию
                delCursor = cursor
            }
            // если нашли нужный ключ, и сам ключ не удален, то возращаем значение
            if let cell = e, cell.key == key, !cell.isDeleted {
                return (cell, cursor)
            }
            // иначе идем по стрелке
            
            // если индекс из середины, то увеличиваем на 1, иначе идём в начало таблицы
            if (cursor + 1 <= capacity() - 1) {
                cursor += 1
            } else {
                cursor = 0
            }
            
            //если мы сделали полный оборот, то ничего не нашли
            if (cursor == idx) {
                if let delCursor = delCursor { return (nil, delCursor) }
                else { return (nil, nil) }
            }
            
            // иначе смотрим на очередную ячейку
            e = buckets[cursor]
        }
        // делаем оптимизацию, если нашли по пути удаленную ячейку,то меняем курсор
        // на тот, где эта ячейка находится
        if let delCursor = delCursor {
            cursor = delCursor
        }
        return (nil, cursor)
    }
    
    @discardableResult
    /// поиск ячейки
    /// 1. или на номер ячейки, где ключ найден, чтобы его перезаписать, например
    /// 2. или на первый nil ячейку в таблице
    /// 3. или на первую лениво удаленную ячейку
    private func getNode(key: Key) -> (node: Node?, cursor: Int?) {
        
        if self.type == .linear(0) {
            return self.getNodeInLinear(key: key)
        }
        
        // номер попытки
        var i = 0
        
        // сначала считаем hash:
        var idx = hash(key, i: i)
        
        // переменная для хранения индекса лениво удаленного элемента:
        var delCursor: Int?
        // получаем начальную ячейку по индексу с шагом 0
        var e = buckets[idx]

        while (e != nil)
        {
            if let cell = e, cell.isDeleted {
                // если при проходе замечаем удаленную ссылку, то сохраняем ее,
                // чтоб потом сделать оптимизацию
                delCursor = idx
            }
            // если нашли нужный ключ, и сам ключ не удален, то возращаем значение
            if let cell = e, cell.key == key, !cell.isDeleted {
                return (cell, idx)
            }
            // иначе идем по стрелке
            
            i += 1
            idx = hash(key, i: i)

            // иначе смотрим на очередную ячейку
            e = buckets[idx]
        }
        // делаем оптимизацию, если нашли по пути удаленную ячейку,то меняем курсор
        // на тот, где эта ячейка находится
        if let delCursor = delCursor {
            idx = delCursor
        }
        return (nil, idx)
    }
    
    
    @discardableResult
    func del(key: Key) -> Value? {
        guard let node = self.getNode(key: key).node else { return nil } //не нашли такой ноды
        node.isDeleted = true
        size -= 1
        return node.value
    }
    
    private func rehash() {
        // для начала сохраним прошлые корзины, непустые и не помеченные как удаленные
        let oldBuckets = buckets.filter { $0?.isDeleted == false }.compactMap { $0 }

        //вычисляем размер новой таблицы
        let newCapacity = (buckets.count * 2) + 1
        // не забываем про новый рубеж, когда нужно будет выполнить rehash():
        threshold = Int(Float(newCapacity) * loadFactor)
        
        // создаем новые корзины
        buckets = Array<Node?>(repeatElement(nil, count: newCapacity))
        
        // обнуляем размер
        size = 0
        
        oldBuckets.forEach {
            put(key: $0.key, value: $0.value)
        }
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
