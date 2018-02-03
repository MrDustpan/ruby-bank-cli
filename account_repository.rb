class AccountRepository
  def initialize()
    @accounts = []
    @next_id = 0
  end

  def get_all_accounts
    @accounts
  end

  def add(account)
    account.id = @next_id += 1
    @accounts << account
  end
end