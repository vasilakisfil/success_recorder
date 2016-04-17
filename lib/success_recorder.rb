require 'success_recorder/version'
require 'redis/objects'

module SuccessRecorder
  def self.success!(*args)
    Adapter.new(args).success
  end

  def self.failure!(*args)
    Adapter.new(args).failure
  end

  def self.report(*args)
    Adapter.new(args).report
  end
end

require_relative 'success_recorder/adapter'
