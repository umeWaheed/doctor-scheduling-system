# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/v1/appointments', type: :request do

  path '/api/v1/doctors/{doctor_id}/appointments' do
    parameter name: 'doctor_id', in: :path, type: :string, description: 'Doctor id'

    get("view a doctors's appointment") do
      tags 'Doctors'

      response(200, 'successful') do
        let(:doctor_id) { '1' }

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

    post('create appointment') do
      tags 'Appointments'
      consumes "application/json"
      parameter name: :appointment, in: :body, schema: {
        type: :object,
        required: %i[slot_id patient_name],
        properties: {
          slot_id: { type: :integer },
          patient_name: { type: :string }
        }
      }

      let!(:appointment) do
        create(:appointment)
      end

      response(200, 'successful') do
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

  path '/api/v1/appointments/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'Appointment id'

    get('show appointment') do
      tags 'Appointments'

      response(200, 'successful') do
        let(:id) { '1' }

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

    put('update appointment') do
      tags 'Appointments'
      consumes "application/json"
      parameter name: :appointment, in: :body, schema: {
        type: :object,
        required: %i[doctor_id slot_id patient_name],
        properties: {
          doctor_id: { type: :integer },
          slot_id: { type: :integer },
          patient_name: { type: :string }
        }
      }

      response(200, 'successful') do
        let(:id) { '1' }
        let!(:appointment) do
          create(:appointment)
        end

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

    delete('delete appointment') do
      tags 'Appointments'

      response(200, 'successful') do
        let(:id) { '1' }

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
