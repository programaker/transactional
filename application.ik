["transactional", "database", "entity"] each(iokeFile, use(iokeFile))

application = Origin mimic do(
    runCorrect = transactional(
        e1 = Entity mimic(1, "foo", "foo entity")
        Database save(e1)
        
        e2 = Entity mimic(2, "lalala", "another entity")
        Database save(e2)
        
        e3 = Entity mimic(3, "lerolero", "3rd entity")
        Database save(e3)
    )
    
    runError = transactional(
        e1 = Entity mimic(4, "four", "4th entity")
        Database save(e1)
        
        e2 = Entity mimic(5, "jdjdjdjd", "...")
        Database save(e2)
        
        ;; this invalid entity will signal an error condition!
        e3 = Entity mimic(nil, nil, "evil invalid entity")
        Database save(e3)
    )
    
    showDatabase = method(
        Database list each(println)
    )
)

"\"run correct - insert some entities into database\"" println
application runCorrect
application showDatabase

"\n\"run error - try to insert more entities, but an error happend and all changes were rolled back\"" println
application runError
application showDatabase
