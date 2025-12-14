function __PlaypenBlackList() {
	static _list = [
		// Linux
		"/boot",
		"/home",
		"/lib",
		"/lib64",
		"/media",
		"/mnt",
		"/opt",
		"/proc",
		"/root",
		"/run",
		"/srv",
		"/sys",
		"/tmp",
		
		// macOS
		"/Applications",
		"/Library",
		"/System",
		"/Users",
		"/Volumes",
		"/cores",
		"/home",
		"/private",

		// common (both)
		"/bin",
		"/dev",
		"/etc",
		"/sbin",
		"/tmp",
		"/usr",
		"/var",
	];

	return _list;
}