# Instead of adding all require statements in lib/fund_america.rb
# require 'fund_america/all' is used
# In this all.rb file all require statements for files in lib/fund_america
# directory must be given
require 'fund_america/version'
require 'fund_america/api'
require 'fund_america/error'

# API end points below
require 'fund_america/api_info'
require 'fund_america/ach_authorization'
require 'fund_america/background_check'
require 'fund_america/bank_info'
require 'fund_america/billing_log'
require 'fund_america/cancel_offering_request'
require 'fund_america/close_offering_request'
require 'fund_america/customer_agreement'
require 'fund_america/electronic_signature'
require 'fund_america/entity_relationship'
require 'fund_america/entity'
require 'fund_america/escrow_agreement'
require 'fund_america/escrow_service_application'
require 'fund_america/investment_payment'
require 'fund_america/investment'
require 'fund_america/investor'
require 'fund_america/offering'
require 'fund_america/plaid_authentication'
require 'fund_america/subscription_agreement'
require 'fund_america/subscription_agreement_template'
require 'fund_america/trade_review'
require 'fund_america/webhook_log'
require 'fund_america/investor_payment'
require 'fund_america/distribution'
require 'fund_america/holding'
require 'fund_america/email_log'
require 'fund_america/bank_transfer_method'

