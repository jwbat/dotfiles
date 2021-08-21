const randInt = (low, high) =>
  Math.floor(Math.random() * (high - low + 1) + low);

const swap = (arr, i, j) => [arr[i], arr[j]] = [arr[j], arr[i]];

function shuffle(arr) {
  for (i = arr.length - 1; i > 0; i--) {
    let r = randInt(0, i - 1);
    swap(arr, r, i);
  }
}
