# frozen_string_literal: true

module Caution
  # An error to raise when an object or system is in an unsupported state.
  # Inspired by Java's IllegalStateException
  # (https://docs.oracle.com/javase/8/docs/api/index.html?java/lang/IllegalStateException.html)
  # and .Net's InvalidOperationException
  # (https://docs.microsoft.com/en-us/dotnet/api/system.invalidoperationexception?view=netframework-4.7.2).
  #
  # Note that this is named IllegalStateError and not IllegalStateException as it inherits from
  # StandardError and all of the classes which inherit from StandardError in the Ruby Standard
  # Library end in Error.
  class IllegalStateError < StandardError
  end
end
