///gives us the stack trace from CRASH() without ending the current proc.
/proc/stack_trace(msg)
	CRASH(msg)

GLOBAL_REAL_VAR(list/stack_trace_storage)
/proc/gib_stack_trace()
	stack_trace_storage = list()
	stack_trace()
	stack_trace_storage.Cut(1, min(3,stack_trace_storage.len))
	. = stack_trace_storage
	stack_trace_storage = null

///Vrell - fuck it putting it here since its a debugging tool
/proc/stringify_list(var/list)
	if("[list]" == "/list")
		. = "\["
		for(var/item in list) {
			. += stringify_list(item)
			. += ", "
		}
		. += "\]"
		return
	else
		return "[list]"
