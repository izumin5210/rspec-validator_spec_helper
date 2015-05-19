require 'spec_helper'

RSpec.describe RSpec::ValidatorSpecHelper do
  context 'when the spec is for a validator extended AM::EachValidator' do
    include RSpec::ValidatorSpecHelper
    before(:all) do
      TestEachValidator = Class.new(ActiveModel::EachValidator)
    end

    before do
      allow(RSpec).to(
        receive_message_chain(:current_example, :full_description)
            .and_return('TestEachValidator')
      )
    end

    it { expect(validator_class).to eq TestEachValidator }
    it { expect(validator_type).to eq ActiveModel::EachValidator }
    it { expect(validator_name).to eq 'TestEachValidator' }
    it { expect(validation_name).to eq 'test_each' }
    it { expect(value).to be_nil }

    it 'includes ActiveModel::Validations' do
      expect(model_class).to be_include(ActiveModel::Validations)
    end

    it 'has TestValidator' do
      expect(model_class.validators).to(be_any { |v| v.is_a? TestEachValidator })
    end

    it { expect(value).to be_nil }
    it { is_expected.to be_a model_class }
    it { expect(subject.value).to eq value }
  end

  context 'when the spec is for a validator extended AM::Validator' do
    include RSpec::ValidatorSpecHelper
    before(:all) do
      TestValidator = Class.new(ActiveModel::Validator)
    end

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

    context 'when attribute_names has not set' do
      it { expect(value).to be_nil }
      it { is_expected.to be_a model_class }
      it { expect(subject.value).to eq value }
    end

    context 'when attribute_names has set' do
      let(:attribute_names) { %i(value1 value2 value3) }
      let(:value1) { 'Cocoa' }
      let(:value2) { 'Chino' }
      let(:value3) { 'Rize' }

      it { is_expected.to be_a model_class }
      it { expect(subject.value1).to eq value1 }
      it { expect(subject.value2).to eq value2 }
      it { expect(subject.value3).to eq value3 }
    end
  end
end
