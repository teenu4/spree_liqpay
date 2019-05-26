module Spree
  class PaymentMethod::Liqpay < PaymentMethod
    preference :server, :string, default: 'https://www.liqpay.ua'
    preference :public_key, :string, default: ''
    preference :private_key, :string, default: ''
    preference :order_description, :string, default: -> {Spree::Store.current.name}
    preference :test_mode, :boolean, default: true

    def provider_class
      ActiveMerchant::Billing::Liqpay
    end

    def provider
      @provider ||= provider_class.new preferred_public_key, preferred_private_key
    end

    def source_required?
      false
    end

    def checkout_url
      "#{preferred_server}/api/checkout"
    end

    def cnb_form_fields order, result_url, server_url
      provider.cnb_form_fields amount: order.total,
                               currency: order.currency,
                               description: preferred_order_description,
                               order_id: order.id,
                               result_url: result_url,
                               server_url: server_url,
                               sandbox: preferred_test_mode ? 1 : 0
    end

    def check_signature data, signature
      provider.check_signature data, signature
    end
  end
end
