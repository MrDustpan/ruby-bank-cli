require './account_repository'
require './account_service'
require './account'
require './ui'

repository = AccountRepository.new
service = AccountService.new(repository)

ui = UI.new(service)
ui.index