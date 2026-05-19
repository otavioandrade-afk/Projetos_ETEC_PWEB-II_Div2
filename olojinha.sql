create database olojinha;
use olojinha;
create table categorias
(
    catid int primary key auto_increment,
    catnome varchar(150),
    catativo boolean default 1
);
create table subcategorias
(
    subid int primary key auto_increment,
    subnome varchar(150),
    subcatid int,
    subativo boolean default 1,
    constraint fksubcatid foreign key (subcatid) references categorias (catid)
);
create table produtos
(
    proid int primary key auto_increment,
    pronome varchar(150),
    prodescricao varchar(1024),
    provalorcusto double,
    provalorvenda double,
    proquantidade int,
    prosubid int,
    proativo boolean default 1,
    constraint fkprosubid foreign key (prosubid) references subcategorias (subid)
);
create table fotosproduto
(
    fotid int primary key auto_increment,
    fotcaminho varchar(1024),
    fotdescricao varchar(150),
    fotproid int,
    fotprincipal boolean default 0,
    fotativo boolean default 1,
    constraint fkfotproid foreign key (fotproid) references produtos (proid)
);
insert into categorias (catnome) values
('Acessórios para Veículos'),
('Agro'),
('Alimentos e Bebidas'),
('Pet Shop'),
('Antiguidades e Coleções'),
('Arte, Papelaria e Armarinho'),
('Bebês'),
('Beleza e Cuidado Pessoal'),
('Brinquedos e Hobbies'),
('Calçados, Roupas e Bolsas'),
('Câmeras e Acessórios'),
('Carros, Motos e Outros'),
('Casa, Móveis e Decoração'),
('Celulares e Telefones'),
('Construção'),
('Eletrodomésticos'),
('Eletrônicos, Áudio e Vídeo'),
('Esportes e Fitness'),
('Ferramentas'),
('Festas e Lembrancinhas'),
('Games'),
('Imóveis'),
('Indústria e Comércio'),
('Informática'),
('Ingressos'),
('Instrumentos Musicais'),
('Joias e Relógios'),
('Livros, Revistas e Comics'),
('Música, Filmes e Seriados'),
('Saúde'),
('Serviços'),
('Mais Categorias');
insert into subcategorias
	(subnome,subcatid)
values 
	('Aces. de Carros e Caminhonetes',1),
	('Aces. de Motos e Quadriciclos',1),
	('Estabilizadores e No Breaks',24),
	('Armazenamento',24);
insert into produtos
    (pronome,prodescricao,provalorcusto,provalorvenda,proquantidade,prosubid,)
values
    ('3 Câmera Automotiva Veicular Carro Hd Noturna 1080p Icarbonx','Resolução de vídeo de 1080p para imagens nítidas. Armazenamento expansível de até 128GB com cartão SD. Ângulo de visão de 180° para cobertura ampla. Tela de 2 polegadas para visualização conveniente. Gravação em loop para uso contínuo sem interrupções. Conectividade Wi-Fi com alcance de até 10 metros.',50.50,99.90,10,1),
    ('Tapete Emborrachado Carro Personalizado Jogo 5 Peças Fiat','Jogo Tapete Automotivo Personalizado de Borracha Macio e Impermeável Kit 5 Peças + Lixeira para Carros Eleve o interior do seu carro para um outro nível com nosso exclusivo Jogo de Tapetes Automotivos. Desenvolvido e personalizado para modelos Fiat, este kit de 5 peças, acompanhado por uma prática lixeira, combina o conforto do tapete macio com a durabilidade do material de borracha. A base impermeável oferece segurança e durabilidade para o carpete do veículo, garantindo um visual de luxo e versátilidade para o interior do seu carro. Características: Personalizado com Logo e Nome da Montadora Solado no Tapete do Motorista Borracha de Alta Qualidade Material Macio e Maleável Base Antiderrapante Espessura 4mm Impermeável Sem odor Atenção: Todos os nossos produtos possuem fotos reais, sendo assim você receberá exatamente o produto que é oferecido nas imagens.',37,73.9,10,1),
    ('Capacete Robocop Escamoteável Fechado Mixs Gladiator Delta S Cor Cinza Vermelho Fosco Tamanho do capacete 62','Estrutura externa em ABS de alto impacto que absorve a energia de colisões em um único ponto estrutural. Viseira de policarbonato de alto impacto com 2 mm de espessura e proteção UV contra radiação solar. Sistema de engate rápido que permite colocar ou retirar o capacete sem necessidade de ajustes manuais constantes. Interior em cacharrel termoformada com forro respirável que permite a circulação de ar durante o uso. Entradas de ventilação nas posições inferior e superior para o controle de fluxo de ar dentro do casco. Forração interna totalmente desmontável para facilitar a higienização recorrente e a manutenção da higiene.',105.65,279.9,5,2),
('Fone De Ouvido Para Capacete Moto Bluetooth Headset Rgb Sem Fio Kateluo','Quantidade de intercomunicadores: 1. Alcance máximo de 1.2 km para comunicação clara durante a pilotagem. Autonomia da bateria de 16 horas para longas viagens. Conexão Bluetooth 5.3 para emparelhamento rápido e estável. À prova dágua com classificação IPX6, resistente à chuva. Sistema de redução de ruído para áudio limpo e sem interferências. Design elegante com iluminação RGB para estilo no capacete.',5.87,78.9,10,2),
    ('Unidade de estado sólido Kingston M.2 NVMe PCIe 4.0 NV3 de 1 TB, azul escuro','Capacidade: 1 TB. Com tecnologia 3D NAND. É útil para salvar programas e documentos com a sua capacidade de 1 TB. Tamanho de NVME 4.0. Interface de conexão: NVMe 4.0. Compatível com PC e Notebook Velocidade de Leitura até 6000MB/s e Gravação Até 4000MB/s',500,969,5,4),
    ('Ssd Kingston 480gb Sata Iii A400 Sa400s37/480g Cor Cinza-escuro','Capacidade: 480 GB. Velocidade de leitura de até 500 MB/s para desempenho superior em tarefas. Velocidade de gravação de até 450 MB/s para transferências rápidas. Consumo energético de apenas 0.195W em modo inativo. Dado de cache de 64 MB para melhor desempenho em acesso a dados. Tecnologia 3D NAND para maior durabilidade e eficiência. Compatível com diversos sistemas operativos, incluindo Windows e Linux.',154.78,525.96,5,4),
    ('Nobreak Intelbras Attiv 1500 Va Bi Interativo Bivolt Cor Preto','Voltagem de entrada CA: 127/220V. Voltagem de saída: 127V. Voltagem de entrada: 127/220V. Potência nominal de 1500 VA para garantir alimentação estável. Compatível com entradas de 110V e 220V. Sistema interativo com informações em tempo real. Autonomia máxima da bateria de até 10 horas. Oito tomadas disponíveis para múltiplos aparelhos. Indicador LED para fácil monitoramento do status.',765.98,950,2,3),
    ('Nobreak Interativo Monovolt Intelbras Xnb 600va 120v Cor Preto','No break interactiva. Tem 4 tomadas. Adequado para eletrodomésticos. Peso: 4.26 kg. Energia garantida para seus produtos em caso de problemas elétricos. Intelbras XNB 600 600VA possui potência de pico de 600VA, ideal para eletrodomésticos.',243.9,315,2,3);
insert into fotosproduto
    (fotcaminho,fotdescricao,fotproid)
values
    ('imgprodutos/a-1.webp','',1),
    ('imgprodutos/b-1.webp','',1),
    ('imgprodutos/c-1.webp','',1),
    ('imgprodutos/d-1.webp','',1),
    ('imgprodutos/e-1.webp','',1),
    ('imgprodutos/f-1.webp','',1),
    ('imgprodutos/g-1.webp','',1),
    ('imgprodutos/h-1.webp','',1),
    ('imgprodutos/i-1.webp','',1),
    ('imgprodutos/a-2.webp','',2),
    ('imgprodutos/b-2.webp','',2),
    ('imgprodutos/c-2.webp','',2),
    ('imgprodutos/d-2.webp','',2),
    ('imgprodutos/e-2.webp','',2),
    ('imgprodutos/f-2.webp','',2),
    ('imgprodutos/g-2.webp','',2);