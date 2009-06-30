use("transaction")

transactional = dsyntax(
    [code]
    
    ''(method(
        t = Transaction mimic
        
        bind(
            rescue(fn(c,
                "FATAL ERROR! ROLLBACK! \"#{c text}\"" println
                t rollback
            )),
            
            t start
            'code
            t commit
        )
    ))
)
