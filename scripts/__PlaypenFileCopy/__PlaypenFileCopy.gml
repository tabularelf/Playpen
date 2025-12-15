// feather ignore all
/// @ignore
/// @return {Real}
function __PlaypenFileCopy(_filepath, _newFilepath) {
	return file_copy(_filepath, _newFilepath) == -1 ? false : true;
}