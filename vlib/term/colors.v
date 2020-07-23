// Copyright (c) 2019-2020 Alexander Medvednikov. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module term

[inline]
pub fn format(msg, open, close string) string {
	return '\x1b[' + open + 'm' + msg + '\x1b[' + close + 'm'
}

[inline]
pub fn format_rgb(r, g, b int, msg, open, close string) string {
	return '\x1b[$open;2;$r;$g;${b}m' + msg + '\x1b[${close}m'
}

[inline]
pub fn rgb(r, g, b int, msg string) string {
	return format_rgb(r, g, b, msg, '38', '39')
}

[inline]
pub fn bg_rgb(r, g, b int, msg string) string {
	return format_rgb(r, g, b, msg, '48', '49')
}

[inline]
pub fn hex(hex int, msg string) string {
	return format_rgb(hex >> 16, hex >> 8 & 0xFF, hex & 0xFF, msg, '38', '39')
}

[inline]
pub fn bg_hex(hex int, msg string) string {
	return format_rgb(hex >> 16, hex >> 8 & 0xFF, hex & 0xFF, msg, '48', '49')
}

[inline]
pub fn bg_black(msg string) string {
	return format(msg, '40', '49')
}

[inline]
pub fn bright_bg_black(msg string) string {
	return format(msg, '100', '49')
}

[inline]
pub fn bg_blue(msg string) string {
	return format(msg, '44', '49')
}

[inline]
pub fn bright_bg_blue(msg string) string {
	return format(msg, '104', '49')
}

[inline]
pub fn bg_cyan(msg string) string {
	return format(msg, '46', '49')
}

[inline]
pub fn bright_bg_cyan(msg string) string {
	return format(msg, '106', '49')
}

[inline]
pub fn bg_green(msg string) string {
	return format(msg, '42', '49')
}

[inline]
pub fn bright_bg_green(msg string) string {
	return format(msg, '102', '49')
}

[inline]
pub fn bg_magenta(msg string) string {
	return format(msg, '45', '49')
}

[inline]
pub fn bright_bg_magenta(msg string) string {
	return format(msg, '105', '49')
}

[inline]
pub fn bg_red(msg string) string {
	return format(msg, '41', '49')
}

[inline]
pub fn bright_bg_red(msg string) string {
	return format(msg, '101', '49')
}

[inline]
pub fn bg_white(msg string) string {
	return format(msg, '47', '49')
}

[inline]
pub fn bright_bg_white(msg string) string {
	return format(msg, '107', '49')
}

[inline]
pub fn bg_yellow(msg string) string {
	return format(msg, '43', '49')
}

[inline]
pub fn bright_bg_yellow(msg string) string {
	return format(msg, '103', '49')
}

[inline]
pub fn black(msg string) string {
	return format(msg, '30', '39')
}

[inline]
pub fn bright_black(msg string) string {
	return format(msg, '90', '39')
}

[inline]
pub fn blue(msg string) string {
	return format(msg, '34', '39')
}

[inline]
pub fn bright_blue(msg string) string {
	return format(msg, '94', '39')
}

[inline]
pub fn bold(msg string) string {
	return format(msg, '1', '22')
}

[inline]
pub fn cyan(msg string) string {
	return format(msg, '36', '39')
}

[inline]
pub fn bright_cyan(msg string) string {
	return format(msg, '96', '39')
}

[inline]
pub fn dim(msg string) string {
	return format(msg, '2', '22')
}

[inline]
pub fn green(msg string) string {
	return format(msg, '32', '39')
}

[inline]
pub fn bright_green(msg string) string {
	return format(msg, '92', '39')
}

[inline]
pub fn gray(msg string) string {
	return bright_black(msg)
}

[inline]
pub fn hidden(msg string) string {
	return format(msg, '8', '28')
}

[inline]
pub fn italic(msg string) string {
	return format(msg, '3', '23')
}

[inline]
pub fn inverse(msg string) string {
	return format(msg, '7', '27')
}

[inline]
pub fn magenta(msg string) string {
	return format(msg, '35', '39')
}

[inline]
pub fn bright_magenta(msg string) string {
	return format(msg, '95', '39')
}

[inline]
pub fn reset(msg string) string {
	return format(msg, '0', '0')
}

[inline]
pub fn red(msg string) string {
	return format(msg, '31', '39')
}

[inline]
pub fn bright_red(msg string) string {
	return format(msg, '91', '39')
}

[inline]
pub fn strikethrough(msg string) string {
	return format(msg, '9', '29')
}

[inline]
pub fn underline(msg string) string {
	return format(msg, '4', '24')
}

[inline]
pub fn white(msg string) string {
	return format(msg, '37', '39')
}

[inline]
pub fn bright_white(msg string) string {
	return format(msg, '97', '39')
}

[inline]
pub fn yellow(msg string) string {
	return format(msg, '33', '39')
}

[inline]
pub fn bright_yellow(msg string) string {
	return format(msg, '93', '39')
}
