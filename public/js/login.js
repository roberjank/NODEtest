const BASE_URL = 'http://localhost:3000';
const formEl = document.forms.login;
const errorsContainerEl = document.querySelector('.errors');

formEl.addEventListener('submit', (event) => {
  event.preventDefault();
  const loginUserData = {
    fullname: formEl.elements.fullname.value,
    email: formEl.elements.email.value,
    password: formEl.elements.password.value,
  };

  loginUser(loginUserData);
});

async function loginUser(loginUserData) {
  const resp = await fetch(`${BASE_URL}/auth/login`, {
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
    localStorage.setItem('token24', dataInJs.data);
    window.location.replace('index.html');
  }
}

function handleErrors(erorrArray) {
  errorsContainerEl.innerHTML = '';
  erorrArray.forEach((err) => {
    errorsContainerEl.innerHTML += `<p>${err.message}</p>`;
  });
}
