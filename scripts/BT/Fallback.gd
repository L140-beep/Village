class_name Fallback
extends BtNode

var children = []

func _init(child_nodes : Array):
    children = child_nodes

func execute():
    # for child in children:
        # match child.execute()
    

    return BtResult.Failure
    
    
    
        
