-- +micrate Up
CREATE TABLE comentarios (
  id BIGSERIAL PRIMARY KEY,
  nome VARCHAR,
  email VARCHAR,
  texto TEXT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS comentarios;
