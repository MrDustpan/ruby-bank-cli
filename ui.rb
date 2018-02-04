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
      puts "('add' = add account | (ID) = account details | 'exit' = quit)"
      print "> "
      
      command = gets.strip
    end while invalid_index_command?(command)

    case command
      when "add"
        add
      when "exit"
        clear_screen
        puts "Goodbye."
      else
        account_details command.to_i
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

  def account_details(id)
    account = @account_service.get_account_details(id)
    clear_screen

    if account.nil?
      index
      return
    end

    begin
      puts account.name
      puts "-------------------------------------------------------------------"
      account.transactions.each { |t| puts "$" + t.amount.to_s + " " + t.description }
      puts ""
      puts "('add' = add transaction | 'exit' = back to index)"
      print "> "
      
      command = gets.strip
    end while invalid_account_command?(command)

    case command
      when "add" 
        add_transaction(id)
      else
        index
      end
  end

  def add_transaction(account_id)
    clear_screen
    print "Enter the amount: "
    amount = gets.to_f

    puts ""
    print "Enter the description: "
    description = gets.strip

    @account_service.record_transaction(account_id, amount, description)

    account_details(account_id)
  end

  private

  def clear_screen
    system "clear" or system "cls"
  end

  def invalid_index_command?(command)
    command != "add" && command != "exit" && command.to_i <= 0
  end

  def invalid_account_command?(command)
    command != "add" && command != "exit"
  end
end