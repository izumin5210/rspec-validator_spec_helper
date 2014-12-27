# RSpec::ValidatorSpecHelper

Provide dummy class for validator spec

## Installation

Add this line to your application's Gemfile, then execute `bundle install`.

```ruby
gem 'rspec-validator_spec_helper'
```

Then include `Rspec::ValidatorSpecHelper` into your `RSpec.configuration`.

```ruby
# spec/rails_helper.rb or spec/spec_helper.rb
RSpec.configure do |config|

  config.include RSpec::ValidatorSpecHelper, type: :validator

end
```


## Usage

`RSpec::ValidatorSpecHelper` provides some `let` and `subject` to your example groups.


### EachValidator

```ruby
describe EmailValidator, type: :validator do
  describe '#validate_each' do
    context 'with invalid format address' do
      let(:value) { 'kokoro.pyonpyon' }
      it { is_expected.to_not be_valid }
    end

    context 'with valid foramt address' do
      let(:value) { 'kokoro.pyonpyon@example.com' }
      it { is_expected.to be_valid }
    end
  end
end
```


### Validator

```ruby
describe NotOverlappedValidator, type: :validator do
  let(:attribute_names) { [:begin_at, :end] }
  let(:begin_at) { Time.parse("2014-12-24T12:00:00+09:00") }

  describe '#validate' do
    context 'when end_at is overlapped' do
      let(:end_at) { Time.parse("2014-12-24T09:00:00+09:00") }
      it { is_expected.to_not be_valid }
    end

    context 'when end_at is not overlapped' do
      let(:end_at) { Time.parse("2014-12-24T19:00:00+09:00") }
      it { is_expected.to be_valid }
    end
  end
end
```


## License

RSpec::ValidatorSpecHelper is licensed under [MIT-LICENSE](http://opensource.org/licenses/MIT).
