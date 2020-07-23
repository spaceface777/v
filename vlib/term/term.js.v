module term

// get_terminal_size returns a number of colums and rows of terminal window.
pub fn get_terminal_size() (int, int) {
	return (JS.process.stdout.columns, process.stdout.rows)
}

pub fn clear() {
	JS.console.clear()
}
