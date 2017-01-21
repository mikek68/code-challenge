Rails.configuration.stripe = {
  :publishable_key => 'pk_test_T62n807KJkydQQu0jeD0YApD',
  :secret_key      => 'sk_test_rUbqblPoNeiCrIbDICdcbaSJ'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]