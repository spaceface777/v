module builtin

pub struct Option {
	ok      bool
	is_none bool
	err     string
	errcode int
	data    any
}

pub fn opt_ok(data any) Option {
	return Option{ ok: true, data: data }
}

pub fn opt_none() Option {
	return Option{ is_none: true }
}

pub fn error(s string) Option {
	return Option{ err: s }
}

pub fn error_with_code(s string, code int) Option {
	return Option{ err: s, errcode: code }
}
