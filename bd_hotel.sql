CREATE TABLE quarto (
	numero INT NOT NULL PRIMARY KEY,
  	valor_diaria FLOAT NOT NULL,
   	vista_mar BOOLEAN 
);

CREATE TABLE cliente (
  	ID SERIAL PRIMARY KEY,
	nome VARCHAR(48) NOT NULL,
  	rg VARCHAR(8) NOT NULL,
  	telefone VARCHAR(12) NOT NULL
)

INSERT INTO cliente (nome, rg, telefone ) VALUES 
	('João Pereira', '12345678', '(11)98765432'), 
	('Rafael Alves', '98765432', '(12)91234567')
    
    
CREATE TABLE estadia(
  	id SERIAL PRIMARY KEY,
	fk_id_quarto INT NOT NULL,
  	fk_id_cliente INT NOT NULL,
  	CONSTRAINT fk_quarto FOREIGN KEY (fk_id_quarto) REFERENCES quarto(numero),
  	CONSTRAINT fk_cliente FOREIGN KEY (fk_id_cliente) REFERENCES cliente(id)
)

INSERT INTO estadia(fk_id_quarto, fk_id_cliente) VALUES
	(101, 1),
    (102, 2),
    (201, 1),
    (102, 2)
    
CREATE TABLE meio_pagamento (
	id SERIAL PRIMARY key,
  	nome VARCHAR(18) NOT NULL
)

INSERT into meio_pagamento (nome) VALUES
	('dinheiro'),
    ('cartão de crédito'),
    ('cartão de débito')
	
    
ALTER TABLE estadia 
	ADD COLUMN data_entrada VARCHAR(48), 
    ADD COLUMN data_saida VARCHAR(48) , 
    ADD COLUMN valor_total FLOAT,
    add COLUMN fk_id_meio_pagamento INT,
    add CONSTRAINT fk_meio_pagamento FOREIGN KEY (fk_id_meio_pagamento) 
    	REFERENCES meio_pagamento(ID);
        
UPDATE estadia 
	SET data_saida = '2023-12-12T08:54:00',
    valor_total = 148.99,
    fk_id_meio_pagamento = 1 
    WHERE id = 4
    
SELECT * FROM estadia