const needleRegex = r'{%}';
const needle = '{%}';
final RegExp exp = new RegExp(needleRegex);

String interpolate(String string, List l) {
  Iterable<RegExpMatch> matches = exp.allMatches(string);

  assert(l.length == matches.length);

  var i = -1;
  return string.replaceAllMapped(exp, (match) {
    print(match.group(0));
    i = i + 1;
    return '${l[i]}';
  });
}
