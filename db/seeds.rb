# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
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
  { name: 'Tecidos', description: 'Reciclável tecidos incluem roupas, toalhas, lençóis e mais.',
    category: 'Tecidos' },
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
