// feather ignore all
/// @ignore
function __PlaypenFileRename(_filepath, _newFilepath) {
	return bool(file_rename(_filepath, _newFilepath));
}