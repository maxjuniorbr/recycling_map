# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seeds.rb

# db/seeds.rb

# O código a seguir deve ser executado apenas se os registros dos materiais já estiverem na tabela `recyclable_materials`.

# db/seeds.rb

materiais_reciclaveis = [
  { name: 'Papel', description: 'Reciclável papel inclui jornais, revistas, envelopes, papelão e mais.',
    category: 'Papel' },
  { name: 'Plástico', description: 'Reciclável plástico inclui garrafas, recipientes, sacolas e mais.',
    category: 'Plástico' },
  { name: 'Vidro', description: 'Reciclável vidro inclui potes, garrafas e mais.', category: 'Vidro' },
  { name: 'Metal', description: 'Reciclável metal inclui latas, papel alumínio, eletrodomésticos e mais.',
    category: 'Metal' },
  { name: 'Eletrônicos', description: 'Reciclável eletrônicos incluem telefones, computadores e mais.',
    category: 'Eletrônicos' },
  { name: 'Tecidos', description: 'Reciclável tecidos incluem roupas, toalhas, lençóis e mais.', category: 'Tecidos' },
  { name: 'Baterias', description: 'Reciclável baterias incluem baterias de celular, baterias de carro e mais.',
    category: 'Baterias' },
  { name: 'Pneus', description: 'Reciclável pneus incluem pneus de carro, de moto e mais.', category: 'Pneus' },
  { name: 'Óleo de cozinha', description: 'Reciclável óleo de cozinha pode ser transformado em biodiesel.',
    category: 'Óleo' },
  { name: 'Pilhas', description: 'Reciclável pilhas incluem pilhas alcalinas, pilhas de lítio e mais.',
    category: 'Pilhas' }
]

materiais_reciclaveis.each do |material|
  RecyclableMaterial.create!(material)
end

puts 'Dados seed para RecyclableMaterials criados com sucesso!'

collection_points = [
  {
    name: 'Oxxo',
    address: 'R. Manuel Francisco Monteiro - Parque Industrial, Campinas - SP, 13061-155',
    latitude: -22.921495604659967,
    longitude: -47.08277624232715,
    contact: '',
    website: 'https://mercadooxxo.querovantagens.com',
    material_names: %w[Papel Plástico Vidro]
  },
  {
    name: 'Roldão',
    address: 'Rua Padre José Quadros, 244 - Parque Industrial, Campinas - SP, 13031-449',
    latitude: -22.92485695585813,
    longitude: -47.08307646341137,
    contact: '(19) 3772-1790',
    website: 'https://roldao.com.br',
    material_names: %w[Papel Plástico Pilhas]
  },
  {
    name: 'Tenda',
    address: 'Rua Padre Bernardo da Silva, 1111 - São Bernardo, Campinas - SP, 13030-710',
    latitude: -22.92633961538447,
    longitude: -47.08096131821356,
    contact: '(19) 3772-4999',
    website: 'https://www.tendaatacado.com.br',
    material_names: ['Baterias']
  },
  {
    name: 'Oba',
    address: 'Av. das Amoreiras, 1699 - São Bernardo, Campinas - SP, 13012-100',
    latitude: -22.921971546148153,
    longitude: -47.077647672625666,
    contact: '(19) 3772-2880',
    website: 'https://obahortifruti.com.br',
    material_names: %w[Papel Plástico]
  },
  {
    name: 'C&C',
    address: 'Rua Oswaldo Oscar Barthelson, 31 - Jardim Pauliceia, Campinas - SP, 13060-080',
    latitude: -22.914698914636972,
    longitude: -47.10073024083088,
    contact: '(11) 4001-0100',
    website: 'https://www.cec.com.br',
    material_names: %w[Eletrônicos Baterias]
  },
  {
    name: 'Leroy Merlin',
    address: 'Rod. Anhanguera, KM 97 - Jardim Garcia, Campinas - SP, 13061-155',
    latitude: -22.903432766279547,
    longitude: -47.109828293372956,
    contact: '0800 020 5376',
    website: 'https://www.leroymerlin.com.br',
    material_names: %w[Vidro Metal Eletrônicos Baterias]
  },
  {
    name: 'Campneus',
    address: 'Av. das Amoreiras, 3536 - Vila Mimosa, Campinas - SP, 13036-225',
    latitude: -22.932473867327392,
    longitude: -47.09095171892234,
    contact: '',
    website: 'http://www.campneus.com.br',
    material_names: ['Pneus']
  },
  {
    name: 'Ecocentro',
    address: 'R. Dr. Guilherme da Silva, 279 - Ponte Preta, Campinas - SP, 13041-020',
    latitude: -22.90922436486021,
    longitude: -47.05824538886599,
    contact: '(19) 3737-7474',
    website: 'https://www.campinas.sp.gov.br/noticias-integra.php?id=34587',
    material_names: ['Papel', 'Plástico', 'Vidro', 'Metal', 'Tecidos', 'Eletrônicos', 'Baterias', 'Pneus',
                     'Óleo de cozinha', 'Pilhas']
  },
  {
    name: 'Horta Comunitária Vida Verde',
    address: 'R. Monteiro Lobato, 281 - Jardim Chapadão, Campinas - SP, 13070-040',
    latitude: -22.902734613013784,
    longitude: -47.05160433528308,
    contact: '(19) 99625-4182',
    website: '',
    material_names: %w[Tecidos Papel]
  },
  {
    name: 'Reciclare Brasil',
    address: 'R. Olga de Souza Queiroz, 57 - Jardim Leonor, Campinas - SP, 13041-015',
    latitude: -22.91108658651897,
    longitude: -47.0493442759322,
    contact: '(19) 2515-9494',
    website: 'http://www.reciclarebrasil.com.br',
    material_names: %w[Plástico Papel Metal Vidro]
  },
  {
    name: 'Ponto Verde',
    address: 'R. Costa Aguiar, 1945 - Centro, Campinas - SP, 13010-061',
    latitude: -22.90836946502882,
    longitude: -47.06120829101512,
    contact: '(19) 3231-6582',
    website: '',
    material_names: ['Papel', 'Plástico', 'Vidro', 'Metal', 'Eletrônicos', 'Baterias', 'Pneus', 'Óleo de cozinha',
                     'Pilhas']
  }
]

collection_points.each do |point|
  cp = CollectionPoint.create!(
    name: point[:name],
    address: point[:address],
    latitude: point[:latitude],
    longitude: point[:longitude],
    contact: point[:contact],
    website: point[:website]
  )

  point[:material_names].each do |material_name|
    cp.recyclable_materials << RecyclableMaterial.find_by(name: material_name)
  end
end

puts 'Dados seed para CollectionPoints criados com sucesso!'

user = User.create(email: 'test', password: 'test')
puts "Usuário criado com sucesso! E-mail: #{user.email}, senha: #{user.password}"