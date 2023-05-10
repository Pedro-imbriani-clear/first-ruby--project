namespace :dev do
  desc "Configurando o ambiente de desenvolvimento "
  task setup: :environment do
    if Rails.env.development?
      spinner = TTY::Spinner.new("[:spinner] excuindo DB ")
      spinner.auto_spin 
      sleep(2)
    %x(rails db:drop)
    spinner.success("Concluido com sucesso!")

    spinner = TTY::Spinner.new("[:spinner] Criando DB ")
    spinner.auto_spin 
    sleep(2)
     %x(db:create) 
     spinner.success("(Concluido com sucesso!)")

    spinner = TTY::Spinner.new("[:spinner] Migrando DB ")
    spinner.auto_spin 
    sleep(2)
     %x(db:migrate)
     spinner.success("(Concluido com sucesso!)")

     spinner = TTY::Spinner.new("[:spinner] Populamdo DB ")
     spinner.auto_spin 
     sleep(2)
      %x( db:seed)
    spinner.success("(Concluido com sucesso!)")
    else
      puts "Voce nao esta em ambiente de desenvolvimento "
    end
  end
end
