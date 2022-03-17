const BASE_URL = 'http://localhost:3000';
const formEl = document.forms.register;
const errorsContainerEl = document.querySelector('.errors');

formEl.addEventListener('submit', (event) => {
  event.preventDefault();
  const loginUserData = {
    fullname: formEl.elements.fullname.value,
    email: formEl.elements.email.value,
    password: formEl.elements.password.value,
  };

  registerUser(loginUserData);
});

async function registerUser(loginUserData) {
  console.log('registerUser ===', loginUserData);
}
