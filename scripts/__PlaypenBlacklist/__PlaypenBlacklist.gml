function __PlaypenBlackList() {
	static _list = [
		// Linux
		"/bin",
		"/boot",
		"/dev",
		"/etc",
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
		"/usr",
		"/var",
		
		// macOS
		"/Applications",
		"/Library",
		"/System",
		"/Users",
		"/Volumes",
		"/bin",
		"/cores",
		"/dev",
		"/etc",
		"/home",
		"/private",
		"/sbin",
		"/tmp",
		"/usr",
		"/var",
	];

	return _list;
}