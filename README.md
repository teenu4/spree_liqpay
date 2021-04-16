# Spree Liqpay

[Liqpay.ua](https://www.Liqpay.ua/en/) payment gateway API for [Spree E-Commerce](https://spreecommerce.com/).
 
## Installation
 
Update your `Gemfile`:

```ruby
gem 'spree_liqpay', github: 'teenu4/spree_liqpay'
```

Run `Bundler`:

```
bundle install
```
  
## Configuration
  
1. Login to Spree Backend. 

2. Open "Configurations -> Payment Methods"

3. Click "New Payment Method".

4. Choose provider "Spree::PaymentMethod::Liqpay".

5. Enter any name and description. It will be visible to client during checkout. Click "Create".

6. Enter your public and private keys retrieved from [Liqpay.ua](https://www.Liqpay.ua/en/).

7. Enter order description (it will be visible to client during checkout on Liqpay site).

8. Turn off the Test mode.
  
## How it works

1. A client selects Liqpay payment method on Payment tab during checkout on our site.
2. We redirect him to payment form on Liqpay.ua where he makes the payment.
3. Liqpay.ua redirects the client back to our site.
4. We wait for a callback from Liqpay.ua (takes a few seconds) and redirect the client to "Order complete" page.

## Tests

Powered by [RSpec](http://rspec.info/), [Capybara](https://github.com/jnicklas/capybara) and [Selenium](http://www.seleniumhq.org/).

Run `rake app:setup` before the tests to init the dummy app.  

## References

1. [Liqpay.ua official Ruby SDK](https://github.com/liqpay/sdk-ruby) (not used by this gem)
2. [Liqpay.ua FAQ](https://www.Liqpay.ua/en/faq)
3. [Liqpay.ua API reference](https://www.Liqpay.ua/en/doc)
