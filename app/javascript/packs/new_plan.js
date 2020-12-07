const btnDecrement = document.querySelector('#decrement');
const btnIncrement = document.querySelector('#increment');
const input = document.querySelector('#plan_nb_of_days');

const decrement = (e) => { 
  e.preventDefault()
  let inputNumber = parseInt(input.value); 
  inputNumber -= 1;
  input.value = inputNumber; 
};
const increment = (e) => { 
  e.preventDefault()
  let inputNumber = parseInt(input.value); 
  inputNumber += 1; 
  input.value = inputNumber;
};

btnDecrement.addEventListener('click', decrement);
btnIncrement.addEventListener('click', increment);  