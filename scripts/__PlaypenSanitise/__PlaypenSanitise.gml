// feather ignore all
/// @ignore
function __PlaypenSanitise(_path) {
	if (__PLAYPEN_ON_WINDOWS) {
		_path = string_replace_all(_path, "/", "\\");
	} else {
		_path = string_replace_all(_path, "\\", "/");
	}

	return filename_path(_path) + filename_name(_path);
}