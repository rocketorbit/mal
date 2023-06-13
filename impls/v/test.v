import regex

pub fn tokenize(str string) []string {
	mut tokens := []string{}
	query := r'(~@)|\[|\]|\{|\}|' + r"'|" + r'`|~|^|@|"()' //r'\s*,*(~@)|(\[\]\{\}\(\)`~^@' + r"'" + r'`~^@)|"(?:\\.|[^\\"])*"?|(;.*)|[^\s\[\]{}('+ r"'" + r'"`,;)]*)'
	mut re := regex.regex_opt(query) or { panic(err) }
	mut matches := re.find_all_str(str)
	println(matches)
	return tokens
}

fn main() {
	str := "[]{}()'`~^@"
	tokenize(str)
}