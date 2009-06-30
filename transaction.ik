use("database")

Transaction = Origin mimic do(
    initialData = []
    
    start = method(
        self initialData = Database list
    )
    
    commit = method ;; does nothing. just symbolic...
    
    rollback = method(
        Database populate(initialData)
    )
)
