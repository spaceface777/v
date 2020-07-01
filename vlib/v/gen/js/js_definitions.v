module js

const (
	definition_names = ['__deep_eq', '__str']
	definition_docs = [
'	/**
	 * @function
	 * @template T
	 * @param {T} a
	 * @param {T} b
	 * @returns {boolean}
	 */',
'	/**
	 * @function
	 * @param {any} d
	 * @param {number=} l
	 * @returns {string}
	 */']

	definitions = [
	// Checks if the two args (primitives/arrays/objects/maps) passed are deeply equal by value.
	// In JS, `==` and `===` only check by reference, so they do not work in all cases.
	// Adapted from https://www.npmjs.com/fast-deep-equal
"	function __deep_eq(a, b) {
		if (a === b) return true;
		if (a && b && typeof a == 'object' && typeof b == 'object') {
			if (a.constructor !== b.constructor) return false;
			var length, i, keys;
			if (Array.isArray(a) && Array.isArray(b)) {
				length = a.length;
				if (length != b.length) return false;
				for (i = length; i-- !== 0;)
					if (!__deep_eq(a[i], b[i])) return false;
				return true;
			}
			if ((a instanceof Map) && (b instanceof Map)) {
				if (a.size !== b.size) return false;
				for (i of a.entries()) if (!b.has(i[0])) return false;
				for (i of a.entries()) if (!__deep_eq(i[1], b.get(i[0]))) return false;
				return true;
			}
			keys = Object.keys(a);
			length = keys.length;
			if (length !== Object.keys(b).length) return false;
			for (i = length; i-- !== 0;) if (!Object.prototype.hasOwnProperty.call(b, keys[i])) return false;
			for (i = length; i-- !== 0;) {
				var key = keys[i];
				if (!__deep_eq(a[key], b[key])) return false;
			}
			return true;
		}
		return a !== a && b !== b;
	};\n",
	// Stringifies its arg (primitive/array/object/map), following the behavior of the C backend
	// Custom implementation
"	function __str(d, l = 1) {
		if (typeof d === 'object') {
			if (Array.isArray(d)) return `[\${d.map(v => __str(v, l)).join(', ')}]`;
			if (d instanceof Map) return `{\${Array.from(d.keys()).map(k => `'\${k}': \${__str(d.get(k), l)}`).join(', ')}}`
			let res = `\${d.__name__ || d.constructor.name} {\\n`;
			let k, v;
			for (k in d) {
				v = d[k];
				if (!d.hasOwnProperty(k) || k === '__name__') continue;
				if (Array.isArray(v)) return `[\${v.map(v2 => __str(v2, l))}]`;
				res += `\${' '.repeat(l*4)}\${k}: \${v && v.__str ? v.__str() : __str(v, l+1)}\\n`
			}
			return res + `\${' '.repeat((l-1)*4)}}`;
		} if (typeof d === 'string') return `'\${d}'`;
		return d+'';
	}\n"]
)

fn (mut g JsGen) builtin_definitions() {
	g.enter_namespace('builtin')
	for i, d in definitions {
		if g.enable_doc {
			g.writeln(definition_docs[i])
		}
		g.push_pub_var(definition_names[i])
		g.writeln(d)
	}
	g.writeln('')
	g.escape_namespace()
}
