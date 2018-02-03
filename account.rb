class Account
  attr_accessor :id
  attr_accessor :name
  attr_accessor :balance
  #attr_reader :transactions

  def initialize(name, balance)
    @name = name
    @balance = balance
    #@transactions = []
  end

  #def record_transaction(amount, description)
    #@transactions << AccountTransaction.new(amount, description)
    #@balance += amount
  #end
end