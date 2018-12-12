# frozen_string_literal: true

require 'spec_helper'

describe Caution do
  it 'has a version number' do
    expect(Caution::VERSION).not_to be nil
  end

  [Caution::CauseInjectingError, Caution::IllegalStateError].each do |error_class|
    specify "#{error_class} can be thrown" do
      tester = -> { raise error_class }

      expect { tester.call }.to raise_error error_class
    end
  end
end
