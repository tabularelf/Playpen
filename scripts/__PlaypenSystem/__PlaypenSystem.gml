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