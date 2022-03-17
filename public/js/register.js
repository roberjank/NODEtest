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
  const resp = await fetch(`${BASE_URL}/auth/register`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(loginUserData),
  });
  const dataInJs = await resp.json();

  if (dataInJs.success === false) {
    handleErrors(dataInJs.error);
  }
  if (dataInJs.success === true) {
    window.location.replace('login.html');
  }
}

function handleErrors(erorrArray) {
  errorsContainerEl.innerHTML = '';
  erorrArray.forEach((err) => {
    errorsContainerEl.innerHTML += `<p>${err.message}</p>`;
  });
}
