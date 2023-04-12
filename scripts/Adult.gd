extends Human

var workplace : Workplace = null
var cash = 50000

var findHome = false
var findJop = false
var wantToEat = false

func _ready():
    ._ready()
    create_schedule()

func get_needs():
    if workplace == null and cash < 100000:
        personal_goals.append(Goal.new(ActionType.FindJob, 5, -1))
    if home == null:
        personal_goals.append(Goal.new(ActionType.FindHome, 7, -1))

func create_schedule():
    if workplace == null and cash < 100000:
        var boards = get_parent().get_boards()
        
        var min_distance = global_position.distance_to(boards[0])
        var goal_node = boards[0]
        
        for board in boards:
            if global_position.distance_to(boards[0]) < min_distance:
                min_distance = global_position.distance_to(boards[0])
                goal_node = board
        
        personal_goals.append(Goal.new(goal_node, 5, -1))
    
    if home == null:
        pass