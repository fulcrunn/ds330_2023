CREATE DATABASE Locadora

/* atv1_logico: */

CREATE TABLE Cliente (
    Nome VARCHAR(100),
    Endereco VARCHAR(50),
    Telefone VARCHAR(15),
    Profissao VARCHAR(50),
    Contato VARCHAR(50),
    TelContato VARCHAR(15),
    NumHabilitacao VARCHAR(10),
    CatHabilitacao VARCHAR(2),
    Cpf VARCHAR(11) PRIMARY KEY
);

CREATE TABLE Veiculo (
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    Cor VARCHAR(15),
    Placa VARCHAR(7) PRIMARY KEY,
    Status ENUM('livre','alugado','manutecao','baixado'),
    Km DOUBLE,
    ValorDiaria FLOAT,
    NumPortas INTEGER,
    CapPassageiros INTEGER,
    Opcionais ENUM('basico','master','luxo')
);

CREATE TABLE Aluga (
    fk_Cliente_Cpf VARCHAR(11),
    fk_Veiculo_Placa VARCHAR(7),
    DataRetirada DATETIME,
    DataDevolucao DATETIME,
    KmRetirada DOUBLE NOT NULL,
    KmDevolucao DOUBLE NULL,
    ValorAluguel FLOAT,
    DiasPrevistos INTEGER,
    FOREIGN KEY (fk_Cliente_Cpf) REFERENCES Cliente (Cpf) ON DELETE SET NULL,
    FOREIGN KEY (fk_Veiculo_Placa) REFERENCES Veiculo (Placa) ON DELETE SET NULL
);

/*ALTER TABLE Aluga MODIFY KmDevolucao DOUBLE;*/

/*Inserts nas tabelas*/
 
INSERT INTO Cliente VALUE ('Joao','Rua 1','41 123','Jardineiro','Esposa','41 124','123456','B','123456789'), ('Maria','Rua 2','41 456','Medica','Mae','41 457','456123','AB','789456123'),('Teresa','Rua 3','41 789','Professora','Tia','41 159','654321','B','456789123');
INSERT INTO Veiculo VALUE ("Fiat", "Uno", "Verde", "ABC123", "livre", 5000, 80.00, 3, 5, 'basico'),("Volkwagen", "Gol", "Vermelho", "CBA123", "alugado", 7000, 85.00, 3, 5, 'basico'),("Toyota", "Corolla", "Prata", "FGT123", "livre", 1000, 200.00, 5, 5, 'master'),("BMW", "X5", "Bordo", "ERT123", "livre", 5600, 500.00, 5, 6, 'luxo');
INSERT INTO Aluga VALUE ("123456789","FGT123","2008-11-11 13:23:44","2008-11-16 12:00:00","1000","NULL",1400,7);

/*Consultas*/

select Cliente.Nome, Veiculo.Marca, Veiculo.Modelo, Veiculo.Placa from Cliente, Veiculo, Aluga where Veiculo.Placa = Aluga.fk_Veiculo_Placa AND Cliente.Cpf = Aluga.fk_Cliente_Cpf;


