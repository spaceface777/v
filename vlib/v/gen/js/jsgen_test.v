import os

const (
	test_dir   = 'vlib/v/gen/js/tests/'
	output_dir = '_js_tests/'
	v_options  = '-b js -w'
)




/*
	ts_exe        = 'npx typescript'
	ts_flags      = '--allowJs --checkJs --noemit --lib es6 --downlevelIteration'
	ts_node_flags = '--'
)
*/











fn test_example_compilation() {
	vexe := os.getenv('VEXE')
	os.chdir(os.dir(vexe))

	os.mkdir_all(output_dir)

	files := find_test_files()
	for file in files {
		path := os.join_path(test_dir, file)
		println('Testing $file')

		build_result := os.exec('$vexe $v_options -o ${output_dir}${file}.js $path') or { assert false return }
		if build_result.exit_code != 0 { // Compilation failed
			os.rmdir_all(output_dir)
			assert false
		}

		exec_result := os.exec('node ${output_dir}${file}.js') or {	assert false return }
		if exec_result.exit_code != 0 || 'unhandled' in exec_result.output.to_lower() { // Running failed
			os.rmdir_all(output_dir)
			assert false
		}
	}

	os.rmdir_all(output_dir)
}

fn find_test_files() []string {
	files := os.ls(test_dir) or { panic(err) }
	mut tests := files.filter(it.ends_with('.v'))
	tests.sort()
	return tests
}
