module NeonApi
  module GeneratePaymentSlipToPayer
    URL = 'V1/PaymentSlip/GeneratePaymentSlipToPayer'
    def self.create(bank_account, payer_id, cpf, due_date, value, instructions = [], send_mail_to_payer = false, description="Boleto de Teste")
      NeonApi.client.send_request(payload(bank_account, payer_id, cpf, due_date, value, instructions, send_mail_to_payer, description), URL)
    end

    def self.payload(bank_account, payer_id, cpf, due_date, value, instructions = [], send_mail_to_payer = false, description="Boleto de Teste")
      {
          "ClientID": NeonApi.client.client_id,
          "BankAccountId": bank_account,
          "PayerId": payer_id,
          "CPF": cpf,
          "DueDate": due_date,
          "Value": value,
          "Instructions": instructions,
          "SendEmailToPayer": send_mail_to_payer,
          "Description": description
      }.to_json
    end
  end
end

