class Goal:
    enum GOAL_TYPE {Personal, Obligatory, Emergency}
    enum ACTION_TYPE {Work, Promenade, Shopping}

    var type
    var action
    var time
    var duration
    var priority

    func initialize(_type, _action, _priority, _duration, _time):
        pass


    