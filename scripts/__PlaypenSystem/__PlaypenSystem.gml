#macro __PLAYPEN_ON_WINDOWS ((os_type == os_windows) || (os_type == os_xboxseriesxs) || (os_type == os_gdk))

#macro __PLAYPEN_VERSION "1.0.0"
#macro __PLAYPEN_DATE "15/12/2025 4:24 AM"
#macro __PLAYPEN_CREDITS "@TabularElf - https://tabelf.link/"

function __PlaypenSystem() {
	static _global = {
		whitelist: [],
		blacklist: __PlaypenBlackList(),
	};
	
	return _global;
}

__PlaypenTrace($"v{__PLAYPEN_VERSION} initialised! Created by {__PLAYPEN_CREDITS}. Last updated on {__PLAYPEN_DATE}");