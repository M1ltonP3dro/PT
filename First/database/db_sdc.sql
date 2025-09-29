-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02/06/2025 às 00:51
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_sdc`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `consultas`
--

CREATE TABLE `consultas` (
  `id` int(11) NOT NULL,
  `paciente_id` int(11) NOT NULL,
  `medico_id` int(11) NOT NULL,
  `data_hora_consulta` datetime NOT NULL,
  `motivo` text NOT NULL,
  `estado` varchar(150) NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `actualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `consultas`
--

INSERT INTO `consultas` (`id`, `paciente_id`, `medico_id`, `data_hora_consulta`, `motivo`, `estado`, `criado_em`, `actualizado_em`) VALUES
(1, 1, 1, '2025-06-01 10:10:10', 'Diarreia Aguda', 'Agendado', '2025-05-29 04:16:25', '2025-05-29 04:16:25'),
(2, 1, 1, '2025-06-01 10:00:00', 'Sprimabé', 'Concluído', '2025-06-01 09:17:04', '2025-06-01 09:34:47');

-- --------------------------------------------------------

--
-- Estrutura para tabela `especialidades`
--

CREATE TABLE `especialidades` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `especialidades`
--

INSERT INTO `especialidades` (`id`, `nome`) VALUES
(3, 'Cardiologia'),
(2, 'ciente'),
(4, 'Dermatologia'),
(7, 'Neurologia'),
(6, 'Oftalmologia'),
(5, 'Ortopedia'),
(8, 'Pediatria'),
(1, 'sla');

-- --------------------------------------------------------

--
-- Estrutura para tabela `medicos`
--

CREATE TABLE `medicos` (
  `id` int(11) NOT NULL,
  `nome_completo` varchar(150) NOT NULL,
  `data_nascimento` date NOT NULL,
  `genero` varchar(50) NOT NULL,
  `especialidade_id` int(11) NOT NULL,
  `email` varchar(150) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `actualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `medicos`
--

INSERT INTO `medicos` (`id`, `nome_completo`, `data_nascimento`, `genero`, `especialidade_id`, `email`, `telefone`, `criado_em`, `actualizado_em`) VALUES
(1, 'SLA DE CAMARÕES', '0000-00-00', 'Masculino', 1, 't1@gmail.com', '+244999999998', '2025-05-29 04:16:25', '2025-05-29 04:16:25'),
(2, 'b2', '2007-03-31', 'Feminino', 2, 'b2@gmail.com', '928783248', '2025-05-31 17:28:25', '2025-06-01 09:13:50'),
(7, 'fdsfdfsdf', '2007-03-31', 'masculino', 3, 'shnk@gmail.com', '345678', '2025-06-01 22:45:59', '2025-06-01 22:45:59'),
(11, 'rxdcgfhbj', '2008-08-31', 'feminino', 5, 'shdbud@gmsil.com', '3456789', '2025-06-01 22:49:49', '2025-06-01 22:49:49'),
(14, 'rxdcgfh', '2008-08-31', 'feminino', 3, 'shdbu@gmsil.com', '34567893', '2025-06-01 22:50:25', '2025-06-01 22:50:25');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pacientes`
--

CREATE TABLE `pacientes` (
  `id` int(11) NOT NULL,
  `nome_completo` varchar(150) NOT NULL,
  `genero` varchar(50) NOT NULL,
  `data_nascimento` date NOT NULL,
  `email` varchar(150) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `actualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `consulta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pacientes`
--

INSERT INTO `pacientes` (`id`, `nome_completo`, `genero`, `data_nascimento`, `email`, `telefone`, `senha`, `criado_em`, `actualizado_em`, `consulta_id`) VALUES
(1, 'SLA DE CAMÕES', 'Masculino', '2002-02-02', 't@gmail.com', '+244999999999', '123', '2025-05-29 04:16:25', '2025-05-29 04:16:25', 0),
(2, 'a', '', '2007-03-31', '2b@gmail.com', '928783247', '$2y$10$hmTFLEkwKSENTTw6Cn9xP.vMUAmw7oZKNBlWdvDo7gbuHRpXltE/q', '2025-05-31 16:52:26', '2025-05-31 16:52:26', 0),
(6, 'b2', '', '2007-03-31', 'b2@gmail.com', '928783248', '$2y$10$PUQ0j/3xegIGOp/1XLCa1.MoMafiS.aRsSZSQEQ9Ib.hu33qX48KG', '2025-05-31 17:16:06', '2025-05-31 17:16:06', 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paciente_id` (`paciente_id`),
  ADD KEY `medico_id` (`medico_id`);

--
-- Índices de tabela `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices de tabela `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome_completo` (`nome_completo`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `telefone` (`telefone`),
  ADD KEY `especialidade_id` (`especialidade_id`);

--
-- Índices de tabela `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome_completo` (`nome_completo`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `telefone` (`telefone`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `medicos`
--
ALTER TABLE `medicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `consultas`
--
ALTER TABLE `consultas`
  ADD CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`),
  ADD CONSTRAINT `consultas_ibfk_2` FOREIGN KEY (`medico_id`) REFERENCES `medicos` (`id`);

--
-- Restrições para tabelas `medicos`
--
ALTER TABLE `medicos`
  ADD CONSTRAINT `medicos_ibfk_1` FOREIGN KEY (`especialidade_id`) REFERENCES `especialidades` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
