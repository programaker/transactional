Entity = Origin mimic do(
    id = 0
    name = ""
    description = ""
    
    initialize = method(id, name, description,
        if(id nil? || name nil? || description nil?, error!("invalid arguments!!!"))    
        self id = id
        self name = name
        self description = description
    )
    
    == = method(other,
        bind(rescue(fn(c, false)), id == other id)
    )
    
    asText = method(
        "#{id}: #{name} - #{description}"
    )
)
