# ⚠️ Caution ⚠️

[![Build Status](https://travis-ci.org/bluemarblepayroll/caution.svg?branch=master)](https://travis-ci.org/bluemarblepayroll/caution)

Essential general purpose Ruby error classes.

## Usage

Two error classes are provided. The first is IllegalStateError which is intended to be raised from inside a method when the current internal state would prevent a successful operation. For those coming from Java or .Net, this is analogous to an IllegalStateError or an InvalidOperationException.

### Caution::IllegalStateError Example

```ruby
  def delete
    raise Caution::IllegalStateError, 'can not delete when not persisted' unless persisted?

    # logic here to actually perform the delete
  end
```

The second class is CauseInjectingError which is intended for cases when wrapping a low level exception with a higher level exception. It is intended to be subclassed with an error class which fits the application's domain. The benefit it provides is that information about the lower level exception is available in the CauseInjectingError's message. This can be helpful when using application frameworks which are not aware of Ruby's fairly recent [Exception#cause](https://ruby-doc.org/core-2.6.0.preview2/Exception.html#method-i-cause) method.

### Caution::CauseInjectingError Example

```ruby
  # Define your own subclass:
  class HighLevelError < Caution::CauseInjectingError; end

  # Then use the error to wrap a low level error:
  def process_records
    records.each do |record|
      begin
        # some low level code to process the record which could raise a LowLevelError
      rescue LowLevelError
        # Like all Ruby 2 exceptions, the LowLevelError is captured in the cause:
        raise HighLevelError, 'Could not process record #{record.id}'
      end
    end
  end

  def main
    process_records
  rescue => error
    # The HighLevelError message is printed along with the LowLevelError
    # message and stack trace. Without CauseInjectingError, only HighLevelError
    # information is included in the message.
    $stderr.puts("An unexpected error occured: #{error.message}")
  end
```

## Installation

To install through Rubygems:

````
gem install install caution
````

You can also add this to your Gemfile:

````
bundle add caution
````

## Contributing

### Development Environment Configuration

Basic steps to take to get this repository set up:

1. Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/) (check caution.gemspec for versions supported)
2. Install bundler (`gem install bundler`)
3. Clone the repository (`git clone git@github.com:bluemarblepayroll/caution.git`)
4. Navigate to the root folder (`cd caution`)
5. Install dependencies (`bundle`)

### Running Tests

To execute the test suite run:

````
rspec
````

Also be sure to run Rubocop:

```
rubocop
```

### Pull Requests

Pull requests are welcome! Please ensure that the tests and Rubocop are passing before submission.

## License

This project is MIT Licensed.
