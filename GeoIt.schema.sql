CREATE TABLE address_types (
 id SERIAL NOT NULL PRIMARY KEY,
 name CHARACTER VARYING NOT NULL
);


CREATE TABLE images (
 id SERIAL NOT NULL PRIMARY KEY,
 url CHARACTER VARYING NOT NULL
);


CREATE TABLE measure_units (
 id SERIAL NOT NULL PRIMARY KEY,
 name CHARACTER VARYING NOT NULL
);


CREATE TABLE phone_types (
 id SERIAL NOT NULL PRIMARY KEY,
 name CHARACTER VARYING NOT NULL
);


CREATE TABLE settings (
 id SERIAL NOT NULL PRIMARY KEY,
 system_available BOOLEAN DEFAULT false NOT NULL,
 min_app_version SMALLINT DEFAULT 0 NOT NULL,
 actual_app_version SMALLINT DEFAULT 0 NOT NULL,
 request_login_access_app BOOLEAN DEFAULT true NOT NULL,
 max_results_per_search SMALLINT DEFAULT 10 NOT NULL,
 max_user_distance_search_near SMALLINT DEFAULT 1000 NOT NULL,
 max_user_distance_search_away SMALLINT DEFAULT 1000 NOT NULL,
 show_establishment_only_during_work_hour BOOLEAN DEFAULT false NOT NULL,
 images_url_path CHARACTER VARYING NOT NULL
);


CREATE TABLE state (
 id SERIAL NOT NULL PRIMARY KEY,
 name CHARACTER VARYING NOT NULL,
 code CHARACTER VARYING(2) NOT NULL
);


CREATE TABLE tags (
 id SERIAL NOT NULL PRIMARY KEY,
 name CHARACTER VARYING NOT NULL
);


CREATE TABLE users (
 id SERIAL NOT NULL PRIMARY KEY,
 name CHARACTER VARYING NOT NULL,
 surname CHARACTER VARYING,
 gender SMALLINT NOT NULL,
 email CHARACTER VARYING NOT NULL,
 password CHARACTER VARYING NOT NULL
);


CREATE TABLE user_authentication (
 user_id SERIAL NOT NULL PRIMARY KEY,
 login_access_token CHARACTER VARYING,
 facebook_access_token CHARACTER VARYING,

 FOREIGN KEY (user_id) REFERENCES users (id)
);


CREATE TABLE week_days (
 id SERIAL NOT NULL PRIMARY KEY,
 name CHARACTER VARYING(10) NOT NULL
);


CREATE TABLE cities (
 id SERIAL NOT NULL PRIMARY KEY,
 state_id INTEGER NOT NULL,
 name CHARACTER VARYING NOT NULL,
 ddd INTEGER NOT NULL,

 FOREIGN KEY (state_id) REFERENCES state (id)
);


CREATE TABLE establishment_types (
 id SERIAL NOT NULL PRIMARY KEY,
 name CHARACTER VARYING NOT NULL,
 description CHARACTER VARYING,
 icon_id INTEGER NOT NULL,

 FOREIGN KEY (icon_id) REFERENCES images (id)
);


CREATE TABLE log_search (
 id BIGSERIAL NOT NULL PRIMARY KEY,
 user_id INTEGER NOT NULL,
 word CHARACTER VARYING NOT NULL,
 latitude NUMERIC(10,6) NOT NULL,
 longitude NUMERIC(10,6) NOT NULL,
 accuracy NUMERIC(9,3) NOT NULL,
 qty_results SMALLINT NOT NULL,
 datetime TIMESTAMP WITH TIME ZONE DEFAULT 'NOW()' NOT NULL,

 FOREIGN KEY (user_id) REFERENCES users (id)
);


CREATE TABLE neighborhoods (
 id SERIAL NOT NULL PRIMARY KEY,
 city_id INTEGER NOT NULL,
 name CHARACTER VARYING NOT NULL,

 FOREIGN KEY (city_id) REFERENCES cities (id)
);


CREATE TABLE product (
 id SERIAL NOT NULL PRIMARY KEY,
 name CHARACTER VARYING NOT NULL,
 establishment_type_id INTEGER NOT NULL,
 description CHARACTER VARYING,
 icon_id INTEGER,

 FOREIGN KEY (establishment_type_id) REFERENCES establishment_types (id),
 FOREIGN KEY (icon_id) REFERENCES images (id)
);

CREATE UNIQUE INDEX PRODUCT_ESTABLISHMENT_TYPE_ID_IDX ON PRODUCT (establishment_type_id);


CREATE TABLE service (
 id SERIAL NOT NULL PRIMARY KEY,
 name CHARACTER VARYING NOT NULL,
 establishment_type_id INTEGER NOT NULL,
 description CHARACTER VARYING,
 icon_id INTEGER,

 FOREIGN KEY (establishment_type_id) REFERENCES establishment_types (id),
 FOREIGN KEY (icon_id) REFERENCES images (id)
);

CREATE INDEX SERVICE_ESTABLISHMENT_ID_IDX ON SERVICE (establishment_type_id);


CREATE TABLE user_profile (
 user_id SERIAL NOT NULL PRIMARY KEY,
 city_id INTEGER NOT NULL,
 birth_date DATE NOT NULL,
 facebook_id CHARACTER VARYING,

 FOREIGN KEY (user_id) REFERENCES users (id),
 FOREIGN KEY (city_id) REFERENCES cities (id)
);


CREATE TABLE bag_products (
 product_is INTEGER NOT NULL,
 establishment_type_id INTEGER NOT NULL,

 PRIMARY KEY (product_is,establishment_type_id),

 FOREIGN KEY (product_is) REFERENCES product (id),
 FOREIGN KEY (establishment_type_id) REFERENCES establishment_types (id)
);

CREATE INDEX BAG_PRODUCTS_ESTABLISHMENT_TYPE_IDX ON BAG_PRODUCTS (establishment_type_id);


CREATE TABLE bag_services (
 service_id INTEGER NOT NULL,
 establishment_type_id INTEGER NOT NULL,

 PRIMARY KEY (service_id,establishment_type_id),

 FOREIGN KEY (service_id) REFERENCES service (id),
 FOREIGN KEY (establishment_type_id) REFERENCES establishment_types (id)
);

CREATE INDEX BAG_SERVICES_ESTABLISHMENT_TYPE_IDX ON BAG_SERVICES (establishment_type_id);


CREATE TABLE bag_tags (
 tag_id INTEGER NOT NULL,
 establishment_type_id INTEGER NOT NULL,

 PRIMARY KEY (tag_id,establishment_type_id),

 FOREIGN KEY (tag_id) REFERENCES tags (id),
 FOREIGN KEY (establishment_type_id) REFERENCES establishment_types (id)
);

CREATE INDEX BAG_TAGS_ESTABLISHMENT_TYPE_ID_IDX ON BAG_TAGS (establishment_type_id);


CREATE TABLE streeties (
 id SERIAL NOT NULL PRIMARY KEY,
 neighborhood_id INTEGER NOT NULL,
 cep CHARACTER VARYING(8) NOT NULL,
 street CHARACTER VARYING NOT NULL,
 street_nickname CHARACTER VARYING,

 FOREIGN KEY (neighborhood_id) REFERENCES neighborhoods (id)
);


CREATE TABLE address (
 id SERIAL NOT NULL PRIMARY KEY,
 street_id INTEGER NOT NULL,
 number INTEGER,
 block CHARACTER VARYING(10),
 lot CHARACTER VARYING(10),
 address_type_id INTEGER NOT NULL,
 floor CHARACTER VARYING(10),
 flat CHARACTER VARYING(10),
 room CHARACTER VARYING(10),
 store CHARACTER VARYING(10),
 complement CHARACTER VARYING,
 latitude NUMERIC(10,6) NOT NULL,
 longitude NUMERIC(10,6) NOT NULL,

 FOREIGN KEY (street_id) REFERENCES streeties (id),
 FOREIGN KEY (address_type_id) REFERENCES address_types (id)
);


CREATE TABLE establishment (
 id SERIAL NOT NULL PRIMARY KEY,
 name CHARACTER VARYING NOT NULL,
 description CHARACTER VARYING NOT NULL,
 type_id INTEGER NOT NULL,
 icon_id INTEGER,
 address_id INTEGER NOT NULL,
 active BOOLEAN DEFAULT false NOT NULL,

 FOREIGN KEY (type_id) REFERENCES establishment_types (id),
 FOREIGN KEY (icon_id) REFERENCES images (id),
 FOREIGN KEY (address_id) REFERENCES address (id)
);


CREATE TABLE establishment_phones (
 id SERIAL NOT NULL PRIMARY KEY,
 establishment_id INTEGER NOT NULL,
 type_id INTEGER NOT NULL,
 ddd INTEGER NOT NULL,
 phone CHARACTER VARYING(10) NOT NULL,

 FOREIGN KEY (establishment_id) REFERENCES establishment (id),
 FOREIGN KEY (type_id) REFERENCES phone_types (id)
);


CREATE TABLE establishment_products (
 establishment_id INTEGER NOT NULL,
 product_id INTEGER NOT NULL,
 cost INTEGER NOT NULL,
 unity_id INTEGER NOT NULL,

 PRIMARY KEY (establishment_id,product_id),

 FOREIGN KEY (establishment_id) REFERENCES establishment (id),
 FOREIGN KEY (product_id) REFERENCES product (id),
 FOREIGN KEY (unity_id) REFERENCES measure_units (id)
);


CREATE TABLE establishment_services (
 establishment_id INTEGER NOT NULL,
 service_id INTEGER NOT NULL,

 PRIMARY KEY (establishment_id,service_id),

 FOREIGN KEY (establishment_id) REFERENCES establishment (id),
 FOREIGN KEY (service_id) REFERENCES service (id)
);


CREATE TABLE establishment_settings (
 establishment_id SERIAL NOT NULL PRIMARY KEY,
 use_products_list BOOLEAN DEFAULT true NOT NULL,
 show_products_list BOOLEAN DEFAULT false NOT NULL,
 use_services_list BOOLEAN DEFAULT true NOT NULL,
 show_services_list BOOLEAN DEFAULT false NOT NULL,
 use_working_schedule BOOLEAN DEFAULT true NOT NULL,

 FOREIGN KEY (establishment_id) REFERENCES establishment (id)
);


CREATE TABLE establishment_tags (
 tag_id INTEGER NOT NULL,
 establishment_id INTEGER NOT NULL,

 PRIMARY KEY (tag_id,establishment_id),

 FOREIGN KEY (tag_id) REFERENCES tags (id),
 FOREIGN KEY (establishment_id) REFERENCES establishment (id)
);

CREATE INDEX ESTABLISHMENT_TAGS_ESTABLISHMENT_ID_IDX ON ESTABLISHMENT_TAGS (establishment_id);


CREATE TABLE establishment_working_schedule (
 id SERIAL NOT NULL PRIMARY KEY,
 establishment_id INTEGER NOT NULL,
 week_day_id INTEGER NOT NULL,
 start_time TIME NOT NULL,
 end_time TIME NOT NULL,
 is_working BOOLEAN DEFAULT true NOT NULL,

 FOREIGN KEY (establishment_id) REFERENCES establishment (id),
 FOREIGN KEY (week_day_id) REFERENCES week_days (id)
);


CREATE TABLE log_establishment_access (
 id BIGSERIAL NOT NULL PRIMARY KEY,
 log_search_id BIGINT NOT NULL,
 result_index SMALLINT NOT NULL,
 establishment_id INTEGER NOT NULL,
 datetime TIMESTAMP WITH TIME ZONE DEFAULT 'NOW()' NOT NULL,

 FOREIGN KEY (log_search_id) REFERENCES log_search (id),
 FOREIGN KEY (establishment_id) REFERENCES establishment (id)
);


CREATE TABLE log_map_access (
 id BIGSERIAL NOT NULL PRIMARY KEY,
 log_establishment_access_id BIGINT NOT NULL,
 datetime TIMESTAMP WITH TIME ZONE DEFAULT 'NOW()' NOT NULL,

 FOREIGN KEY (log_establishment_access_id) REFERENCES log_establishment_access (id)
);


COMMENT ON TABLE address_types IS 'Tipos de logradouro.';
COMMENT ON COLUMN address_types.id IS 'Código do tipo de endereço.';
COMMENT ON COLUMN address_types.name IS 'Nome do tipo de endereço.';
COMMENT ON TABLE images IS 'Icones/Fotos de estabelecimentos, produtos e serviços.';
COMMENT ON COLUMN images.id IS 'Código da imagem.';
COMMENT ON COLUMN images.url IS 'URL/Path da imagem.';
COMMENT ON TABLE measure_units IS 'Unidades de medida para precificar produtos e/ou serviços';
COMMENT ON COLUMN measure_units.id IS 'Código da unidade de medida.';
COMMENT ON COLUMN measure_units.name IS 'Nome/Símbolo da unidade de medida.';
COMMENT ON TABLE phone_types IS 'Tipos de número de telefone para contato.';
COMMENT ON COLUMN phone_types.id IS 'Código do tipo de telefone.';
COMMENT ON COLUMN phone_types.name IS 'Nome do tipo de telefone.';
COMMENT ON TABLE settings IS 'Configurações do sistema.';
COMMENT ON COLUMN settings.id IS 'Código da configuração.';
COMMENT ON COLUMN settings.system_available IS 'Sistema disponível (setar esse valor false desativa todo sistema mobile, tornando o serviço indisponível!).';
COMMENT ON COLUMN settings.min_app_version IS 'Versão mínima do APP para acessar o sistema.';
COMMENT ON COLUMN settings.actual_app_version IS 'Versão atual do APP.';
COMMENT ON COLUMN settings.request_login_access_app IS 'Necessário fazer login para utilizar o app?';
COMMENT ON COLUMN settings.max_results_per_search IS 'Número máximo de resultados para retornar no app por cada pesquisa.';
COMMENT ON COLUMN settings.max_user_distance_search_near IS 'Distância máxima entre o usuário e o local a ser considerado na busca próxima.';
COMMENT ON COLUMN settings.max_user_distance_search_away IS 'Distância máxima entre o usuário e o local a ser considerado na busca longe(metros).';
COMMENT ON COLUMN settings.show_establishment_only_during_work_hour IS 'Mostrar os estabelecimentos nos resultados no app somente quando estiverem em horário de funcionamento?';
COMMENT ON COLUMN settings.images_url_path IS 'URL padrão do diretório de imagens.';
COMMENT ON TABLE state IS 'Cadastro de estados(do país).';
COMMENT ON COLUMN state.id IS 'Código do estado.';
COMMENT ON COLUMN state.name IS 'Nome do estado.';
COMMENT ON COLUMN state.code IS 'Simbolo/Sigla do estado.';
COMMENT ON TABLE tags IS 'Tags para filtro de busca.';
COMMENT ON COLUMN tags.id IS 'Código da tag.';
COMMENT ON COLUMN tags.name IS 'Nome da tag.';
COMMENT ON TABLE users IS 'Cadastro de usuários.';
COMMENT ON COLUMN users.id IS 'Código.';
COMMENT ON COLUMN users.name IS 'Nome.';
COMMENT ON COLUMN users.surname IS 'Sobrenome.';
COMMENT ON COLUMN users.gender IS 'Sexo.
0 - Female
1 - Male';
COMMENT ON COLUMN users.email IS 'E-mail.';
COMMENT ON COLUMN users.password IS 'Senha de acesso.';
COMMENT ON TABLE user_authentication IS 'Armazena autenticação de acesso de usuários.';
COMMENT ON COLUMN user_authentication.user_id IS 'Usuário.';
COMMENT ON COLUMN user_authentication.login_access_token IS 'Último token gerado de acesso no app.';
COMMENT ON COLUMN user_authentication.facebook_access_token IS 'Token de acesso aos dados do facebook do usuário.';
COMMENT ON TABLE week_days IS 'Dias da semana.';
COMMENT ON COLUMN week_days.id IS 'Código do dia.';
COMMENT ON COLUMN week_days.name IS 'Nome do dia.';
COMMENT ON TABLE cities IS 'Cadastro de cidades.';
COMMENT ON COLUMN cities.id IS 'Código da cidade.';
COMMENT ON COLUMN cities.state_id IS 'Código do estado.';
COMMENT ON COLUMN cities.name IS 'Nome da cidade.';
COMMENT ON COLUMN cities.ddd IS 'DDD padrão da cidade.';
COMMENT ON TABLE establishment_types IS 'Tipo de estabelecimento';
COMMENT ON COLUMN establishment_types.id IS 'Código do tipo de estabelecimento.';
COMMENT ON COLUMN establishment_types.name IS 'Nome do tipo de estabelecimento.';
COMMENT ON COLUMN establishment_types.description IS 'Descrição do tipo de estabelecimento.';
COMMENT ON COLUMN establishment_types.icon_id IS 'Icone padrão do tipo de estabelecimento.';
COMMENT ON TABLE log_search IS 'Log de pesquisas efetuadas.';
COMMENT ON COLUMN log_search.id IS 'Código do log.';
COMMENT ON COLUMN log_search.user_id IS 'Usuário que efetuou a busca.';
COMMENT ON COLUMN log_search.word IS 'Texto/Expressão que o usuário buscou.';
COMMENT ON COLUMN log_search.latitude IS 'Posição geográfica do usuário no momento da busca (latitude).';
COMMENT ON COLUMN log_search.longitude IS 'Posição geográfica do usuário no momento da busca (longitude).';
COMMENT ON COLUMN log_search.accuracy IS 'Posição geográfica do usuário no momento da busca (acurácia da posição identificada).';
COMMENT ON COLUMN log_search.qty_results IS 'Quantidade de resultados obtidos.';
COMMENT ON COLUMN log_search.datetime IS 'Data/Hora da busca.';
COMMENT ON TABLE neighborhoods IS 'Cadastro de bairros.';
COMMENT ON COLUMN neighborhoods.id IS 'Código do bairro.';
COMMENT ON COLUMN neighborhoods.city_id IS 'Código da cidade.';
COMMENT ON COLUMN neighborhoods.name IS 'Nome do bairro.';
COMMENT ON TABLE product IS 'Cadastro de produtos.';
COMMENT ON COLUMN product.id IS 'Código do produto.';
COMMENT ON COLUMN product.name IS 'Nome do produto.';
COMMENT ON COLUMN product.establishment_type_id IS 'Código do tipo de estabelecimento que representa o produto. Ex: Alcool/Farmácia, Alcool/Posto combustível, Alcool/Supermercado.';
COMMENT ON COLUMN product.description IS 'Descrição do produto.';
COMMENT ON COLUMN product.icon_id IS 'Ícone do produto.';
COMMENT ON TABLE service IS 'Cadastro de serviços.';
COMMENT ON COLUMN service.id IS 'Código do serviço.';
COMMENT ON COLUMN service.name IS 'Nome do serviço.';
COMMENT ON COLUMN service.establishment_type_id IS 'Código do tipo de estabelecimento que representa o serviço. Ex: Lavagem/Pet shop, Lavagem/Lava jato, Lavagem/Lavanderia.';
COMMENT ON COLUMN service.description IS 'Descrição do serviço.';
COMMENT ON COLUMN service.icon_id IS 'Ícone do serviço.';
COMMENT ON TABLE user_profile IS 'Perfil de usuários.';
COMMENT ON COLUMN user_profile.user_id IS 'Usuário.';
COMMENT ON COLUMN user_profile.city_id IS 'Cidade de origem.';
COMMENT ON COLUMN user_profile.birth_date IS 'Data de nascimento.';
COMMENT ON COLUMN user_profile.facebook_id IS 'ID do perfil do facebook.';
COMMENT ON TABLE bag_products IS 'Pacote de produtos pré definidos para um determinado tipo de estabelecimento (vincula estes produtos automáticamente no cadastro de um novo estabelecimento).';
COMMENT ON COLUMN bag_products.product_is IS 'Código do produto.';
COMMENT ON COLUMN bag_products.establishment_type_id IS 'Tipo de estabelecimento.';
COMMENT ON TABLE bag_services IS 'Pacote de serviços pré definidos para um determinado tipo de estabelecimento (vincula estes serviços automáticamente no cadastro de um novo estabelecimento).';
COMMENT ON COLUMN bag_services.service_id IS 'Código do serviço.';
COMMENT ON COLUMN bag_services.establishment_type_id IS 'Código do estabelecimento.';
COMMENT ON TABLE bag_tags IS 'Pacote de tags pré definidas para um determinado tipo de estabelecimento (vincula estas tags automáticamente no cadastro de um novo estabelecimento).';
COMMENT ON COLUMN bag_tags.tag_id IS 'Código da tag.';
COMMENT ON COLUMN bag_tags.establishment_type_id IS 'Código do estabelecimento.';
COMMENT ON TABLE streeties IS 'Cadastros de CEPs/Ruas.';
COMMENT ON COLUMN streeties.id IS 'Código do endereço.';
COMMENT ON COLUMN streeties.neighborhood_id IS 'Código do bairro.';
COMMENT ON COLUMN streeties.cep IS 'Número do CEP/Código postal.';
COMMENT ON COLUMN streeties.street IS 'Nome da rua.';
COMMENT ON COLUMN streeties.street_nickname IS 'Segundo nome da rua caso tenha mais de um nome diferente.';
COMMENT ON TABLE address IS 'Cadastro de endereços de estabelecimentos.';
COMMENT ON COLUMN address.id IS 'Código do endereço.';
COMMENT ON COLUMN address.street_id IS 'CEP/Rua.';
COMMENT ON COLUMN address.number IS 'Número do endereço na rua.';
COMMENT ON COLUMN address.block IS 'Quadra/Bloco.';
COMMENT ON COLUMN address.lot IS 'Lote.';
COMMENT ON COLUMN address.address_type_id IS 'Tipo de endereço.';
COMMENT ON COLUMN address.floor IS 'Andar/Piso.';
COMMENT ON COLUMN address.flat IS 'Apartamento.';
COMMENT ON COLUMN address.room IS 'Sala.';
COMMENT ON COLUMN address.store IS 'Loja.';
COMMENT ON COLUMN address.complement IS 'Complemento, ponto de referência etc.';
COMMENT ON COLUMN address.latitude IS 'Posição geográfica (latitude).';
COMMENT ON COLUMN address.longitude IS 'Posição geográfica (longitude).';
COMMENT ON TABLE establishment IS 'Cadastro de estabelecimentos.';
COMMENT ON COLUMN establishment.id IS 'Código do estabelecimento.';
COMMENT ON COLUMN establishment.name IS 'Nome.';
COMMENT ON COLUMN establishment.description IS 'Descrição.';
COMMENT ON COLUMN establishment.type_id IS 'Tipo de estabelecimento.';
COMMENT ON COLUMN establishment.icon_id IS 'Código do ícone/foto de identificação.';
COMMENT ON COLUMN establishment.address_id IS 'Código do endereço.';
COMMENT ON COLUMN establishment.active IS 'Considerar estabelecimento nas pesquisas?.';
COMMENT ON TABLE establishment_phones IS 'Telefones de contato de estabelecimentos.';
COMMENT ON COLUMN establishment_phones.id IS 'Código do telefone.';
COMMENT ON COLUMN establishment_phones.establishment_id IS 'Código do estabelecimento.';
COMMENT ON COLUMN establishment_phones.type_id IS 'Tipo de telefone.';
COMMENT ON COLUMN establishment_phones.ddd IS 'Número DDD.';
COMMENT ON COLUMN establishment_phones.phone IS 'Número telefone.';
COMMENT ON TABLE establishment_products IS 'Produtos cadastrados para os estabelecimentos.';
COMMENT ON COLUMN establishment_products.establishment_id IS 'Código do estabelecimento.';
COMMENT ON COLUMN establishment_products.product_id IS 'Codigo do produto.';
COMMENT ON COLUMN establishment_products.cost IS 'Custo do produto (centavos).';
COMMENT ON COLUMN establishment_products.unity_id IS 'Unidade de medida que representa o custo apresentado.';
COMMENT ON TABLE establishment_services IS 'Serviços cadastrados para os estabelecimentos.';
COMMENT ON COLUMN establishment_services.establishment_id IS 'Código do estabelecimento.';
COMMENT ON COLUMN establishment_services.service_id IS 'Código do serviço.';
COMMENT ON TABLE establishment_settings IS 'Configurações do estabelecimento.';
COMMENT ON COLUMN establishment_settings.establishment_id IS 'Código do estabelecimento.';
COMMENT ON COLUMN establishment_settings.use_products_list IS 'O estabelecimento tem uma lista de produtos para venda?';
COMMENT ON COLUMN establishment_settings.show_products_list IS 'Se tiver, mostrar a lista de produtos do estabelecimento no app?';
COMMENT ON COLUMN establishment_settings.use_services_list IS 'O estabelecimento tem uma lista de serviços para venda?';
COMMENT ON COLUMN establishment_settings.show_services_list IS 'Se tiver, mostrar a lista de serviços do estabelecimento no app?';
COMMENT ON COLUMN establishment_settings.use_working_schedule IS 'Usar/Mostrar horário de funcionamento do estabelecimento?';
COMMENT ON TABLE establishment_tags IS 'Tags para filtro de busca de estabelecimento.';
COMMENT ON COLUMN establishment_tags.tag_id IS 'Código da tag.';
COMMENT ON COLUMN establishment_tags.establishment_id IS 'Código do estabelecimento.';
COMMENT ON TABLE establishment_working_schedule IS 'Horário de funcionamento dos estabelecimentos.';
COMMENT ON COLUMN establishment_working_schedule.id IS 'Código do horário.';
COMMENT ON COLUMN establishment_working_schedule.establishment_id IS 'Código do estabelecimento.';
COMMENT ON COLUMN establishment_working_schedule.week_day_id IS 'Dia da semana.';
COMMENT ON COLUMN establishment_working_schedule.start_time IS 'Hora inicio.';
COMMENT ON COLUMN establishment_working_schedule.end_time IS 'Hora fim.';
COMMENT ON COLUMN establishment_working_schedule.is_working IS 'Funciona neste dia? (estabelecimento estará operando?)';
COMMENT ON TABLE log_establishment_access IS 'Log de acesso a descrição de estabelecimento que apareceu no resultado de pesquisa.';
COMMENT ON COLUMN log_establishment_access.id IS 'Código do registro.';
COMMENT ON COLUMN log_establishment_access.log_search_id IS 'Identificação da busca que o usuário efetuou para obter este resultado.';
COMMENT ON COLUMN log_establishment_access.result_index IS 'Indice/Ranking do resultado na lista de resultados.';
COMMENT ON COLUMN log_establishment_access.establishment_id IS 'Estabelecimento que o usuário acessou.';
COMMENT ON COLUMN log_establishment_access.datetime IS 'Data/Hora do acesso.';
COMMENT ON TABLE log_map_access IS 'Log de acesso a mapa de rota até estabelecimento.';
COMMENT ON COLUMN log_map_access.id IS 'Código do registro.';
COMMENT ON COLUMN log_map_access.log_establishment_access_id IS 'Referência do estabelecimento acessado antes de entrar no mapa.';
COMMENT ON COLUMN log_map_access.datetime IS 'Data/Hora do acesso.';
