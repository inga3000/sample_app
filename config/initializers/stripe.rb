if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key      => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_fVGpz9xDmANCboH1elPZB7VR',
    :secret_key      => 'sk_test_2PISCSyoR3ndrzghgVdeL2aM'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]