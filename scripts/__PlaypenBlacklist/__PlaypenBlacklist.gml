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
		"/sbin",
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
		"/sbin",

		// common (both)
		"/bin",
		"/dev",
		"/etc",
		"/tmp",
		"/usr",
		"/var",
	];

	return _list;
}