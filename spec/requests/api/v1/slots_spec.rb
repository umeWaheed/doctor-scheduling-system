# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/v1/doctors/{id}/slots', type: :request do

  path '/api/v1/doctors/{doctor_id}/slots' do
    # You'll want to customize the parameter types...
    parameter name: 'doctor_id', in: :path, type: :string, description: 'Doctor id'
    parameter name: 'status', in: :query, type: :string, enum: ["available", "booked"], required: false

    get("show doctors's availability") do
      tags 'Doctors'

      response(200, 'successful') do
        let(:doctor_id) { create(:doctor).id }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
