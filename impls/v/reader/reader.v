module reader

import regex

struct Reader
{
mut:
	tokens []string
	position int
}

pub fn (mut r Reader) peek() ?string {
	if r.position >= r.tokens.len { return none }
	return r.tokens[r.position]
}

pub fn (mut r Reader) next() string {
	pos := r.position
	r.position++
	return r.tokens[pos]
}

pub fn tokenize(str string) []string {
	mut tokens := []string{}
	query := r'[\s,]*(~@|[\[\]{}()' + r"'" + r'`~^@]|"(?:\\.|[^\\"])*"?|;.*|[^\s\[\]{}('+ r"'" + r'"`,;)]*)'
	mut re := regex.regex_opt(query) or { panic(err) }
	for mut s in re.find_all_str(str) {
		println('yes: ${s[0]}')
	}
	return tokens
}