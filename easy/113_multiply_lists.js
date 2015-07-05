var fs = require("fs");

function multiplyLists(list1, list2) {
  var products = [];

  for (var i = 0; i < list1.length; i++) {
    products.push(list1[i] * list2[i]);
  }

  return products;
}

function printLine(line) {
  var lists = line.split(" | ");

  for (var i = 0; i < lists.length; i++) {
    lists[i] = lists[i].split(" ").map(function (el) {
      return parseInt(el);
    });
  }

  var products = multiplyLists(lists[0], lists[1]);
  console.log(products.join(" "));
}

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
  if (line != "") {
    printLine(line);
  }
});

