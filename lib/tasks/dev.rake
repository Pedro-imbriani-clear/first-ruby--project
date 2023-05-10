namespace :dev do
  desc 'Configurando o ambiente de desenvolvimento '
  task setup: :environment do
    if Rails.env.development?

      show_spinner('excuindo DB ') { %x(rails db:drop) }
      show_spinner(' Criando DB ') { %x(rails db:create)}
      show_spinner('Migrando DB ') { %x(rails db:migrate) }
       %x(rails dev:add_coins) 
       %x(rails dev:add_mining_types) 

    else
      puts 'Voce nao esta em ambiente de desenvolvimento '
    end
  end

  desc 'Cadastra as Moedas '
  task add_coins: :environment do
    show_spinner("Cadastrando Moedas ") do
    coins = [
      {
        descriotions: 'Bitcoin',
        acronym: 'BTC',
        url_image: 'https://static.vecteezy.com/system/resources/previews/008/822/064/original/3d-design-bitcoin-cryptocurrency-white-background-free-png.png'
      },
      {
        descriotions: 'dogecoin',
        acronym: 'DOGE',
        url_image: 'https://e7.pngegg.com/pngimages/26/210/png-clipart-dogecoin-shiba-inu-scrypt-cryptocurrency-ethereum-coin-mammal-cat-like-mammal-thumbnail.png'
      },
      {
        descriotions: 'Dash',
        acronym: 'DASH',
        url_image: 'data:image/png;base64,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'
      }
    ]
    coins.each do |coin|
      Coin.find_or_create_by!(coin)
    end
  end
end

desc 'Cadastra tipos de mineiraçao '
task add_mining_types: :environment do
  show_spinner("Cadastrando tipos de mineiraçao ") do

  mining_types = [
    {description:"Proof of work", acronym:"PoW"},
    {description:"Proof of Stke", acronym:"PoS"},
    {description:"Proof of Capacity", acronym:"PoC"}
  ]
    mining_types.each do |mining_type|
    MiningType.find_or_create_by!(mining_type)

    end
  end
end

private

  def show_spinner(msg_start, msg_end = 'Concluido')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start} ")
    spinner.auto_spin
    yield
    spinner.success("#{msg_end}")
  end
end 