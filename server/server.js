const jsonServer = require('json-server');
const auth = require('json-server-auth');
const server = jsonServer.create();
const router = jsonServer.router('db.json');
const middlewares = jsonServer.defaults();

// Regras de autorização
const rules = auth.rewriter({
  // Apenas usuários autenticados podem acessar personagens
  personagens: 640, // 6: POST, 4: GET, 0: sem acesso público
  users: 600 // Acesso limitado a CRUD pelo próprio usuário
});

server.use(middlewares);
server.use(rules);
server.use(auth);
server.use(router);

const PORT = process.env.PORT || 3000;
server.listen(PORT, () => {
  console.log(`JSON Server rodando em http://localhost:${PORT}`);
});
