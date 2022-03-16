# NodeTest

## install

1.npm i
2.npm i express morgan cors
3.npm i dotenv
4.npm i demon --save-dev
5.npx eslint --init
6.npm i --save mysql2
7.npm i bcryptjs
8.npm i joi
9.npm i jsonwebtoken

## NodeJS Exam

Sukurti sistemą, kuri leistų jungtis į grupes ir dalintis sąskaitomis.

### DB

1.users (id, full_name, email, password, reg_timestamp);
2.groups (id, name);
3.bills (id, group_id, amount, description);
4.accounts (id, group_id, user_id) <- ši lentelė skirta žinoti kokioms grupėms priklauso kiekvienas vartotojas.

### Back-end

1. Auth: Register/Login su POST.
1. POST: /accounts/ - vartotojas paduoda account ID ir savo token. Į accounts lentelę įsirašo duomenys.
1. GET: /accounts/ - paduoda visas vartotojo grupes (JOIN su groups). ID pasiima iš token.
1. GET: /bills/:id - paduoda vartotojui visas sąskaitas tos grupės.
1. POST /bills/ - įrašo naują sąskaitą specifinei grupei (front'as paduoda: group_id, amount, description)

### Front-end

1. Register: vartotojas įrašo vardą, emailą ir slaptažodį du kartus (jei nesutampa - front'as nepraleidžia).
1. Login: vartotojas įrašo emailą, slaptažodį; gauna token; nukreipia į groups pasirinkimą.
1. Groups: vartotojas mato visas savo grupes (pagal accounts lentelę iš DB). Paspaudus - nuveda į tos grupės bills. Apačioje forma pridėti grupę prie paskyros (t.y. į accounts lentelę).
1. Bills: mato sąskaitas specifinės grupės ir gali pridėti naujas.
