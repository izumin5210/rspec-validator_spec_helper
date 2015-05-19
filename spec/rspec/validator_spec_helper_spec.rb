require 'spec_helper'

RSpec.describe RSpec::ValidatorSpecHelper do
  context 'when the spec is for a validator extended AM::EachValidator' do
    include RSpec::ValidatorSpecHelper
    TestValidator = Class.new(ActiveModel::EachValidator)

    before do
      allow(RSpec).to(
        receive_message_chain(:current_example, :full_description)
            .and_return('TestValidator')
      )
    end

    it { expect(validator_class).to eq TestValidator }
    it { expect(validator_type).to eq ActiveModel::EachValidator }
    it { expect(validator_name).to eq 'TestValidator' }
    it { expect(validation_name).to eq 'test' }
    it { expect(value).to be_nil }

    it 'includes ActiveModel::Validations' do
      expect(model_class).to be_include(ActiveModel::Validations)
    end

    it 'has TestValidator' do
      expect(model_class.validators).to(be_any { |v| v.is_a? TestValidator })
    end

    describe 'value' do
      it { expect(value).to be_nil }
    end

    describe 'subject' do
      it { is_expected.to be_a model_class }
      it { expect(subject.value).to eq value }
    end
  end

  context 'when the spec is for a validator extended AM::Validator' do
    include RSpec::ValidatorSpecHelper
    TestValidator = Class.new(ActiveModel::Validator)

    before do
      allow(RSpec).to(
        receive_message_chain(:current_example, :full_description)
            .and_return('TestValidator')
      )
    end

    it { expect(validator_class).to eq TestValidator }
    it { expect(validator_type).to eq ActiveModel::Validator }
    it { expect(validator_name).to eq 'TestValidator' }
    it { expect(validation_name).to eq 'test' }
    it { expect(value).to be_nil }

    it 'includes ActiveModel::Validations' do
      expect(model_class).to be_include(ActiveModel::Validations)
    end

    it 'has TestValidator' do
      expect(model_class.validators).to(be_any { |v| v.is_a? TestValidator })
    end

    describe 'value' do
      it { expect(value).to be_nil }
    end

    describe 'subject' do
      it { is_expected.to be_a model_class }
      it { expect(subject.value).to eq value }
    end
  end
end
