class Account
  attr_accessor :id
  attr_accessor :name
  attr_accessor :balance
  attr_reader :transactions

  def initialize(name)
    @name = name
    @balance = 0.0
    @transactions = []
  end

  def record_transaction(amount, description)
    @transactions << AccountTransaction.new(amount, description)
    @balance += amount
  end
end