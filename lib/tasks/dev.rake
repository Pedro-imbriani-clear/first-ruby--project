namespace :dev do
  desc "Configurando o ambiente de desenvolvimento "
  task setup: :environment do
    if Rails.env.development?

    show_spinner("excuindo DB "){%x(rails db:drop)}
    show_spinner(" Criando DB "){%x(db:create)} 
    show_spinner("Migrando DB "){%x(db:migrate)}
    show_spinner(" Populamdo DB "){%x( db:seed)}
  

    else
      puts "Voce nao esta em ambiente de desenvolvimento "
    end
  end

  def show_spinner(msg_start,msg_end = "Concluido")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start} ")
    spinner.auto_spin 
    yield
    spinner.success("#{msg_end}")
  end

end
