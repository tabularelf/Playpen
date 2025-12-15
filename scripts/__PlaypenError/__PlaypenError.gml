// feather ignore all
/// @ignore
function __PlaypenError() {
	var _str = "";
	for(var _i = 0; _i < argument_count; ++_i) {
		_str += is_string(argument[_i]) ? argument[_i] : string(argument[_i]);
	}
	show_error($"Playpen {__PLAYPEN_VERSION}\n{_str}", true);
}