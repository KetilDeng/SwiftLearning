//
//  Sequence.swift
//  Swift100Tips
//
//  Created by Kerry on 16/7/14.
//  Copyright © 2016年 DKT. All rights reserved.
//

import Foundation

class Book {
    
    var name:String = ""
    var price:Float = 0.0
    
    init(name: String, price: Float) {
        
        self.name = name
        self.price = price
        
    }
}

class BookListGenerator : GeneratorType {
    
    typealias Element = Book
    
    var currentIndex:Int = 0
    var bookList:[Book]?
    
    init(bookList: [Book]) {
        
        self.bookList = bookList
        
    }
    
    func next() -> Element? {
        
        guard let list = bookList else { return  nil }
        
        if currentIndex < list.count {
            
            let element = list[currentIndex]
            currentIndex += 1
            return element
            
        }else {
            
            return nil
            
        }
    }
    
}

class BookList: SequenceType {
    
    private var bookList:[Book]?
    
    init() {
        
        self.bookList = [Book]()
        
    }
    
    func addBook(book:Book){
        
        self.bookList?.append(book)
        
    }
    
    typealias Generator = BookListGenerator
    
    func generate() -> Generator {
        
        return BookListGenerator(bookList: self.bookList!)
        
    }
    
}
