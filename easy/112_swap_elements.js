var fs = require("fs");

function performSwaps(els, swaps) {
  swaps.forEach(function (swap) {
    var i = swap[0];
    var j = swap[1];
    var temp = els[i];
    els[i] = els[j];
    els[j] = temp;
  });

  return els;
}

function parseLine(string) {
  var halves = string.split(" : ");
  var els = parseEls(halves[0]);
  var swaps = parseSwaps(halves[1]);
  var swapped = performSwaps(els, swaps);
  console.log(swapped.join(" "));
}

function parseEls(string) {
  return string.split(" ");
}

function parseSwaps(string) {
  return string.split(",").map(function (el) {
    return el.split("-").map(function (i) {
      return parseInt(i);
    });
  });
}

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
  if (line != "") {
    parseLine(line);
  }
});
