class UI
  def initialize(account_service)
    @account_service = account_service
  end

  def index
    accounts = @account_service.list_accounts

    begin
      clear_screen

      puts "Account Index"
      puts "-------------------------------------------------------------------"
      accounts.each { |account| puts account.id.to_s + ") " + account.name + ": $" + account.balance.to_s }
      puts ""
      puts "('add' = add account | 'exit' = quit)"
      print "> "
      
      command = gets.strip
    end while invalid_index_command?(command)

    case command
      when "add" then add
      else
        clear_screen
        puts "Goodbye."
    end
  end

  def add
    clear_screen
    print "Enter the account name: "
    name = gets.strip

    puts ""
    print "Enter the account balance: "
    balance = gets.to_f

    @account_service.create_account(name, balance)

    index
  end

  private

  def clear_screen
    system "clear" or system "cls"
  end

  def invalid_index_command?(command)
    command != "add" && command != "exit"
  end
end