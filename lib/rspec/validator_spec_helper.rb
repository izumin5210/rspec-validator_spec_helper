require "rspec/validator_spec_helper/version"
require 'active_model'
require 'active_support'
require 'active_support/core_ext'

module RSpec
  module ValidatorSpecHelper
    ATTRIBUTE_NAME = :value

    def self.included(base)
      base.instance_eval do
        let(:validator_name) do |example|
          example.full_description.match(/\A\w+Validator/)[0]
        end

        let(:validator_class) { Object.const_get(validator_name) }

        let(:validator_type) do
          if validator_class.ancestors.include? ActiveModel::EachValidator
            ActiveModel::EachValidator
          else
            ActiveModel::Validator
          end
        end

        let(:validation_name) do
          validator_name.underscore.gsub(/_validator\Z/, '')
        end

        let(:attribute_names) { [ATTRIBUTE_NAME] }

        let(ATTRIBUTE_NAME) { nil }

        let(:model_class) do
          example_group = self
          Struct.new(*attribute_names) do
            include ActiveModel::Validations

            def self.name
              'DummyModel'
            end

            if example_group.validator_type == ActiveModel::EachValidator
              validates ATTRIBUTE_NAME, :"#{example_group.validation_name}" => true
            else
              validates_with example_group.validator_class
            end
          end
        end

        subject do
          attributes = attribute_names.map { |name| eval("#{name}") }
          model_class.new(*attributes)
        end
      end
    end
  end
end
