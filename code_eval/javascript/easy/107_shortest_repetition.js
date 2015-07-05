var fs  = require("fs");

function shortestRepetition(string) {
  for (var i = 1; i <= string.length; i++) {
    if (hasPeriod(string, i)) {
      return i;
    }
  }
};

function hasPeriod(string, period) {
  if (string.length % period !== 0) { return false; }
  for (var i = period; i + period < string.length; i += period) {
    if (string.slice(i - period, i) !== string.slice(i, i + period)) {
      return false;
    }
  }
  return true;
}

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
  if (line != "") {
    console.log(shortestRepetition(line));
  }
});
