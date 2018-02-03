class AccountService
  def initialize(repository)
    @repository = repository
  end

  def list_accounts
    @repository.get_all_accounts
  end

  def create_account(name, balance)
    account = Account.new(name, balance)
    @repository.add(account)
  end

  def get_account_details(account_id)
  end

  def record_transaction(account_id, amount, description)
  end
end