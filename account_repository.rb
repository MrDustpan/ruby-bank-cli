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

  def get_account(id)
    @accounts.each do |account|
      if account.id == id
        return account
      end
    end
    nil
  end

  def save(account)
    # in memory db, nothing to do
  end
end