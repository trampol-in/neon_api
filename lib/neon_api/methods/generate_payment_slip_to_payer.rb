module NeonApi
  module GeneratePaymentSlipToPayer
    URL = 'V1/PaymentSlip/GeneratePaymentSlipToPayer'
    def self.create(bank_account, payer_id, cpf, due_date, value, instructions = [])
      NeonApi.client.send_request(payload(bank_account, payer_id, cpf, due_date, value, instructions = []), URL)
    end

    def self.payload(bank_account, payer_id, cpf, due_date, value, instructions = [])
      {
          "ClientID": NeonApi.client.client_id,
          "BankAccountId": bank_account,
          "PayerId": payer_id,
          "CPF": cpf,
          "DueDate": due_date,
          "Value": value,
          "Instructions": instructions
      }.to_json
    end
  end
end

