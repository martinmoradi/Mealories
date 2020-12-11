const btnDecrement = document.querySelectorAll(".decrement");
const btnIncrement = document.querySelectorAll(".increment");
const input = document.querySelectorAll(".nb_of_days");

btnDecrement.forEach((btn, i) =>
  btn.addEventListener("click", (e) => {
    e.preventDefault();
    let inputNumber = parseInt(input[i].value);
    inputNumber -= 1;
    if (inputNumber < 1) {
      inputNumber = 1;
    }
    input[i].value = inputNumber;
    return input[i].value;
  })
);

btnIncrement.forEach((btn, i) =>
  btn.addEventListener("click", (e) => {
    e.preventDefault();
    let inputNumber = parseInt(input[i].value);
    inputNumber += 1;
    if (inputNumber > 7) {
      inputNumber = 7;
    }
    input[i].value = inputNumber;
    return input[i].value;
  })
);
