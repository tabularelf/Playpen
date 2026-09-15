#macro __PLAYPEN_ON_WINDOWS ((os_type == os_windows) || (os_type == os_xboxseriesxs) || (os_type == os_gdk))

#macro __PLAYPEN_VERSION "v1.2.0"
#macro __PLAYPEN_DATE "15/09/2026 2:12 PM"
#macro __PLAYPEN_CREDITS "@TabularElf - https://tabelf.link/"

enum PlaypenFlag {
	INVALID = -1,
	READ,
	WRITE,
	BOTH
}

// feather ignore all
/// @ignore
function __PlaypenSystem() {
	static _global = {
		whitelist: [],
	};
	
	return _global;
}

__PlaypenTrace($"{__PLAYPEN_VERSION} initialised! Created by {__PLAYPEN_CREDITS}. Last updated on {__PLAYPEN_DATE}");

#export PLAYPEN_DEFAULT_FILESYSTEM_GM_BEHAVIOUR, PLAYPEN_DEFAULT_WHITELIST_INCLUDED, PlaypenFlag

#export PlaypenBufferLoad, PlaypenBufferLoadAsync, PlaypenBufferLoadExt, PlaypenBufferLoadPartial
#export PlaypenBufferSave, PlaypenBufferSaveAsync, PlaypenBufferSaveExt, PlaypenDirectoryCreate
#export PlaypenDirectoryDestroy, PlaypenDirectoryExists, PlaypenFileAttribute, PlaypenFileCopy
#export PlaypenFileDelete, PlaypenFileExists, PlaypenFileFindClose, PlaypenFileFindFirst
#export PlaypenFileFindNext, PlaypenFileRename, PlaypenHttpGetFile, PlaypenIsWhitelisted
#export PlaypenMd5File, PlaypenScreenSave, PlaypenSha1File, PlaypenSpriteAdd, PlaypenSpriteAddExt
#export PlaypenSpriteSave, PlaypenSurfaceSave, PlaypenWhitelistAdd, PlaypenWhitelistClear
#export PlaypenWhitelistGetAll, PlaypenWhitelistGetFlag, PlaypenWhitelistRemove, PlaypenZipUnzip
#export PlaypenZipUnzipAsync