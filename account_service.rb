class AccountService
  def initialize(repository)
    @repository = repository
  end

  def list_accounts
    @repository.get_all_accounts
  end

  def create_account(name, balance)
    account = Account.new(name)
    account.record_transaction(balance, "Initial balance")
    @repository.add(account)
  end

  def get_account_details(account_id)
    @repository.get_account(account_id)
  end

  def record_transaction(account_id, amount, description)
    account = @repository.get_account(account_id)
    account.record_transaction(amount, description)
    @repository.save(account)
  end
end