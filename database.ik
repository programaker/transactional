(Database = Origin mimic) do(
    mimic = Database ;; it's an evil singleton!
    data = []
    
    save = method(object, 
        data << object
    )
    
    list = method(
        data mimic
    )
    
    populate = method(newData,
        self data = newData
    )
)

