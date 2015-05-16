require 'spec_helper'

RSpec.describe EmailValidator, type: :validator do

  describe 'validator' do
    it { expect(validator_class).to eq EmailValidator }
    it { expect(validator_type).to eq ActiveModel::EachValidator }
    it { expect(validator_name).to eq 'EmailValidator' }
    it { expect(validation_name).to eq 'email' }
  end

  describe 'model_class' do
    it 'includes ActiveModel::Validations' do
      expect(model_class).to be_include(ActiveModel::Validations)
    end

    it 'has EmailValidator' do
      expect(model_class.validators).to(be_any { |v| v.is_a? EmailValidator })
    end
  end

  describe 'value' do
    it { expect(value).to be_nil }
  end

  describe 'subject' do
    it { is_expected.to be_a model_class }
    it { expect(subject.value).to eq value }
  end
end
