var fs = require("fs");

function compressSequence(sequence) {
  var compressed = [];
  var count = 1;

  for (var i = 1; i < sequence.length; i++) {
    if (sequence[i] === sequence[i - 1]) {
      count += 1;
    } else {
      compressed.push(count);
      compressed.push(sequence[i - 1]);
      count = 1;
    }
  }

  compressed.push(count);
  compressed.push(sequence[sequence.length - 1]);
  return compressed;
}

function printLine(line) {
  var sequence = line.split(" ");
  var compressed = compressSequence(sequence);
  console.log(compressed.join(" "));
}

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
  if (line != "") {
    printLine(line);
  }
});
