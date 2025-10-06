
SELECT pedidos.pedido_id, clientes.nome as clientes, pedidos.data_pedido, pedidos.valor_total FROM pedidos INNER JOIN clientes ON pedidos.cliente_id = clientes.cliente_id;

SELECT itens_pedido.item_id, pedidos.pedido_id, itens_pedido.nome_item, itens_pedido.quantidade, itens_pedido.preco_unitario, itens_pedido.sub_total
FROM itens_pedido INNER JOIN pedidos ON itens_pedido.pedido_id = pedidos.pedido_id WHERE itens_pedido.pedido_id = 1;

SELECT pedidos.pedido_id, clientes.nome as clientes, itens_pedido.nome_item, itens_pedido.quantidade, itens_pedido.sub_total FROM pedidos INNER JOIN clientes ON pedidos.cliente_id = clientes.cliente_id INNER JOIN itens_pedido ON pedidos.pedido_id = itens_pedido.pedido_id;

SELECT clientes.nome as clientes, SUM(pedidos.valor_total) as total_gasto FROM clientes INNER JOIN pedidos ON clientes.cliente_id = pedidos.cliente_id GROUP BY clientes.nome ORDER BY total_gasto DESC;

SELECT DISTINCT clientes.nome as clientes
	FROM clientes
    	INNER JOIN pedidos ON clientes.cliente_id = pedidos.cliente_id
        INNER JOIN itens_pedido ON pedidos.pedido_id = itens_pedido.pedido_id
        WHERE itens_pedido.nome_item = "caffe com leite";


CREATE DATABASE livraria;
USE livraria;

CREATE TABLE autores (
    autor_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    nacionalidade VARCHAR(50)
	);

CREATE TABLE categorias (
	categoria_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(100) UNIQUE NOT NULL
	);
    
CREATE TABLE livros ( autor_id INT, categoria_id INT, livro_id INT AUTO_INCREMENT PRIMARY KEY, titulo VARCHAR(100) NOT NULL, lsbn VARCHAR(15) UNIQUE NOT NULL, ano_publicacao DATE NOT NULL, preco DECIMAL NOT NULL, FOREIGN KEY (autor_id) REFERENCES autores(autor_id) ON DELETE CASCADE, FOREIGN KEY (categoria_id) REFERENCES categorias(categoria_id) );
