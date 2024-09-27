-- Criar o banco de dados
CREATE DATABASE /*!32312 IF NOT EXISTS*/ `banco_dados_si` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `banco_dados_si`;

-- Criar a tabela `usuario`
CREATE TABLE `usuario` (
  `email` varchar(100) NOT NULL,
  `nome_usuario` varchar(100) NOT NULL,
  `tipo_usuario` enum('normal','admin') NOT NULL,
  `senha` varchar(255) NOT NULL,
  `status` enum('ativado','desativado') NOT NULL DEFAULT 'ativado',
  PRIMARY KEY (`email`),
  UNIQUE KEY `nome_usuario` (`nome_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Inserir um usuário admin
INSERT INTO `usuario` VALUES 
('admin@sistema.com', 'administrador', 'admin', '$2b$10$.LKCAhQS9.nAxSfUpeg5lOfvtLREs6jV.ZaB6AD7eiRg.gTJIRn4S', 'ativado');

-- Criar a tabela `laboratorio`
CREATE TABLE `laboratorio` (
  `id_laboratorio` int(11) NOT NULL AUTO_INCREMENT,
  `nome_laboratorio` varchar(100) NOT NULL,
  `usuario_email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_laboratorio`),
  UNIQUE KEY `nome_laboratorio` (`nome_laboratorio`),
  KEY `usuario_email` (`usuario_email`),
  CONSTRAINT `laboratorio_ibfk_1` FOREIGN KEY (`usuario_email`) REFERENCES `usuario` (`email`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Criar a tabela `produto`
CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `quantidade` int(11) NOT NULL,
  `sigla` varchar(30) NOT NULL,
  `concentracao` varchar(20) NOT NULL,
  `densidade` varchar(20) NOT NULL,
  `nome_produto` varchar(100) NOT NULL,
  `tipo_unidade_produto` enum('mililitros', 'gramas') NOT NULL,
  `ncm` varchar(45) NOT NULL,
  PRIMARY KEY (`id_produto`),
  UNIQUE KEY `sigla` (`sigla`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Criar a tabela `registro_consumo`
CREATE TABLE `registro_consumo` (
  `id_consumo` int(11) NOT NULL AUTO_INCREMENT,
  `data_consumo` date NOT NULL,
  `id_produto` int(11) NOT NULL,
  `id_laboratorio` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `descricao` varchar(120) NOT NULL,
  PRIMARY KEY (`id_consumo`),
  KEY `id_produto` (`id_produto`),
  KEY `id_laboratorio` (`id_laboratorio`),
  CONSTRAINT `registro_consumo_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`) ON DELETE CASCADE,
  CONSTRAINT `registro_consumo_ibfk_2` FOREIGN KEY (`id_laboratorio`) REFERENCES `laboratorio` (`id_laboratorio`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Criar a tabela `registro_entrada`
CREATE TABLE `registro_entrada` (
  `id_entrada` int(11) NOT NULL AUTO_INCREMENT,
  `data_entrada` date NOT NULL,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `descricao` varchar(120) NOT NULL,
  PRIMARY KEY (`id_entrada`),
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `registro_entrada_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
