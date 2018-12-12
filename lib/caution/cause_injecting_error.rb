# frozen_string_literal: true

module Caution
  # This provide some context as to which lower level exception casued the error.
  # Nested exceptions are a relatively new idea to the Ruby ecosystem most things do not
  # print out the entire exception chain. This works around that by injecting the original
  # stack trace into the error message.
  #
  # Usage:
  #
  # begin
  #   # Some code which may raise an exception
  # end
  # rescue
  #   raise CauseInjectingError, 'An helpful message'
  # end
  #
  # CauseInjectingError will automatically save the original error using the "cause" functionality
  # of Exception.
  #
  # See http://www.virtuouscode.com/2013/12/25/exception-causes-in-ruby-2-1/ for more
  # information.
  class CauseInjectingError < StandardError
    def message
      if cause
        "#{super}\n" \
          "Caused by: #{cause.class}: #{cause.message}\n" \
          "The original stack trace was:\n" \
          "#{cause.backtrace.join("\n")}\n" \
          "END original stack trace \n\n"
      else
        super
      end
    end
  end
end
