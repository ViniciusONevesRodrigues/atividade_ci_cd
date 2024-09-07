const express = require('express');
const cors = require('cors');  // Importar o middleware CORS
const app = express();
const port = 3000;

// Usar o middleware CORS
app.use(cors());

// Middleware para permitir JSON no corpo das requisições
app.use(express.json());

const users = [];

// Rota para retornar a lista de usuários (GET)
app.get('/api/users', (req, res) => {
    res.json(users);
});

// Rota para adicionar um novo usuário (POST)
app.post('/api/users', (req, res) => {
    const newUser = req.body;
    users.push(newUser);
    res.status(201).json(newUser);
});

app.listen(port, () => {
    console.log(`Back-end rodando em http://localhost:${port}`);
});
