require 'rails_helper'

  describe 'oxford service can be instantiated' do
    let(:oxford_service) {OxfordService.new('happy')}
      context 'instance methods'
       it 'should return correct connections and json responses' do 
          conn = oxford_service.faraday_connect
          inflection = oxford_service.response_inflections

          expect(conn.class).to eq Faraday::Connection
          expect(inflection.status).to eq 200
          expect(inflection.body).to eq 'Good'
    end

      it 'should validate json' do
        validate_fail = oxford_service.valid_json?('test string')
        validate_success = oxford_service.valid_json?("{\n    \"metadata\": {\n        \"provider\": \"Oxford University Press\"\n    }}")
        expect(validate_fail).to eq false
        expect(validate_success).to eq true
      end
  end