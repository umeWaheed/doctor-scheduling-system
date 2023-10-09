# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/v1/availabilities', type: :request do

  path '/api/v1/doctors/{doctor_id}/availabilities' do
    parameter name: 'doctor_id', in: :path, type: :string, description: 'Doctor id'

    get("show a doctor's working hours") do
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

    post("create a new availability") do
      tags 'Doctors'
      consumes "application/json"
      parameter name: :availability, in: :body, schema: {
        type: :object,
        required: %i[start_time end_time duration date],
        properties: {
          start_time: { type: :string },
          end_time: { type: :string },
          duration: { type: :integer },
          date: { type: :string}
        }
      }

      response(200, 'successful') do
        let(:availability) { create(:availability) }
        let(:id) { availability.id }
        let(:doctor_id) { availability.doctor_id }

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

  path '/api/v1/doctors/{doctor_id}/availabilities/{id}' do
    parameter name: 'doctor_id', in: :path, type: :string, description: 'Doctor id'
    parameter name: 'id', in: :path, type: :string, description: 'Availability id'

    delete('delete availability') do
      tags 'Doctors'

      response(200, 'successful') do
        let(:availability) { create(:availability) }
        let(:id) { availability.id }
        let(:doctor_id) { availability.doctor_id }

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
