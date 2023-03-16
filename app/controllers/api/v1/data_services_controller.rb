# frozen_string_literal: true

module Api
  module V1
    class DataServicesController < ApplicationController
      protect_from_forgery with: :null_session

      KEYS = {
        'accessRights' => 'access_rights',
        'creator' => 'creators',
        'endpointDescription' => 'endpoint_description',
        'keyword' => 'keywords',
        'licence' => 'license',
        'securityClassification' => 'security_classification',
        'servesData' => 'serves_data',
        'serviceStatus' => 'status',
        'serviceType' => 'service_type',
        'theme' => 'themes'
      }.freeze

      def create
        data_service_form = DataServiceForm.new(data_service_params)
        if (data_service = data_service_form.submit)
          render json: { status: 201, data_service: }
        else
          render json: { status: 422, errors: data_service_form.errors }
        end
      end

      protected

      def data_service_params
        transformed_params.require(:data_service).permit!
      end

      def transformed_params
        params.deep_transform_keys! do |key|
          KEYS.key?(key) ? KEYS[key] : key
        end
      end
    end
  end
end
