// feather ignore all
function __PlaypenTypeValidation(_funcName, _type) {
	if (!is_numeric(_type)) {
		__PlaypenError($"{_funcName} - Wrong type! Expected \"Enum.PlaypenFlag\", received \"{typeof(_type)}\"!");
		return;
	}
 
	if (_type == PlaypenFlag.INVALID) {
		__PlaypenError($"{_funcName} - Cannot use the type \"{nameof(PlaypenFlag.INVALID)}\"!");
		return;
	}

	if (_type < 0 || _type > PlaypenFlag.BOTH) {
		__PlaypenError(
			$"{_funcName} - Invalid type range. Expected \"{nameof(PlaypenFlag.READ)}\",", 
			$"\"{nameof(PlaypenFlag.WRITE)}\",\nor \"{nameof(PlaypenFlag.BOTH)}\". Received \"{_type}\"!"
		);
		return;
	}
}