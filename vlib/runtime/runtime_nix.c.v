module runtime

pub fn nr_cpus() int {
	$if linux || macos || solaris {
		return int(C.sysconf(C._SC_NPROCESSORS_ONLN))
	}
	return 1
}