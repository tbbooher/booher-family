require 'spec_helper'

describe Expense do
  it "should accomplish a request" do
    st, ed = (1.months.ago.to_date), (Date.today)
    fi = OFX::FinancialInstitution.get_institution('USAA')
    fi.set_client(USAA_CREDENTIALS['USAA_NUM'], USAA_CREDENTIALS['USAA_PIN'])
    bsm = fi.send(fi.create_request_document_for_bank_statement(USAA_CREDENTIALS['USAA_ACCOUNT'],(st..ed)))
    expect(bsm.message_sets[1].responses[0]).to eql('foo')
  end
end
